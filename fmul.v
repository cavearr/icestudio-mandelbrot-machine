/***| fmul.v |
 
   Copyright (c) 2025 Jesús Arias 
   Web: https://www.ele.uva.es/~jesus

  --
   Documentation improved by Carlos Venegas 
   X: @cavearr / Github: @cavearr / FPGAwars: charliva@gmail.com
  --

  ┌──────────────────────────────────────────────────────────────────────────┐
  │           SPECIALIZED FRACTIONAL MULTIPLIER FOR MANDELBROT               │
  │                                                                          │
  │  Optimized 16-bit signed Q4.11 fixed-point multiplier designed           │
  │  specifically for Mandelbrot set computation                             │
  │                                                                          │
  │  Anyway this is a generic multiplier useful for any project.             │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module implements a hardcoded fixed-point multiplier optimized     ║
  ║  for Mandelbrot set calculations:                                        ║
  ║                                                                          ║
  ║  • Q4.11 format: 1 sign + 4 integer + 11 fractional bits                 ║
  ║  • Range: [-16.0, +15.999] with resolution 0.00048828125                 ║
  ║  • Single-cycle combinational operation                                  ║
  ║  • Unrolled shift-and-add with sign-magnitude conversion                 ║
  ║  • Optimized for z² + c iterations in Mandelbrot algorithm               ║
  ║  • Rounding instead of truncation for better accuracy                    ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    Q4.11 FIXED-POINT FORMAT                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Bit allocation (16 bits total):                                         │
  │                                                                          │
  │  ┌────┬────┬────┬────┬────┬──────────────────────────────────────────┐   │
  │  │Sign│      Integer      │               Fractional part            │   │
  │  └────┴────┴────┴────┴────┴──────────────────────────────────────────┘   │
  │   15   14   13   12   11   10   9   8   7   6   5   4   3   2   1   0    │
  │   └─┘  └────────┬──────┘   └──────────────┬─────────────────────────┘    │
  │    S      I (4 bits)                  F (11 bits)                        │
  │                                                                          │
  │  Binary point:   SIIII.FFFFFFFFFFF                                       │
  │                       ↑                                                  │
  │                                                                          │
  │  Value = (-1)^S × (I + F/2048)                                           │
  │                                                                          │
  │  Example representations:                                                │
  │  • +2.5   = 0x1400 = 0001_0100_0000_0000₂                                │
  │  • -1.0   = 0xF800 = 1111_1000_0000_0000₂                                │
  │  • +0.25  = 0x0200 = 0000_0010_0000_0000₂                                │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                  MANDELBROT-SPECIFIC OPTIMIZATION                        │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Mandelbrot iteration: z(n+1) = z(n)² + c                                │
  │                                                                          │
  │  Complex multiplication requirements:                                    │
  │  • Real part:    zr² - zi²                                               │
  │  • Imaginary:    2 × zr × zi                                             │
  │                                                                          │
  │  This multiplier is optimized for:                                       │
  │  1. Squaring operations (md = mr frequently)                             │
  │  2. Values typically in range [-2, +2]                                   │
  │  3. High precision near fractal boundaries                               │
  │                                                                          │
  │  Q4.11 format chosen because:                                            │
  │  • Mandelbrot set bounded by |z| ≤ 2                                     │
  │  • Need headroom for z² which can reach 4                                │
  │  • 11 fractional bits give smooth zoom capability                        │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    MULTIPLICATION ALGORITHM                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Step 1: Sign-magnitude conversion                                       │
  │  ─────────────────────────────────                                       │
  │  if (mr < 0) {                                                           │
  │      r = -mr[14:0]    // Make multiplier positive                        │
  │      d = -md          // Negate multiplicand                             │
  │  } else {                                                                │
  │      r = mr[14:0]     // Already positive                                │
  │      d = md           // Keep multiplicand as is                         │
  │  }                                                                       │
  │                                                                          │
  │  Step 2: Unrolled partial products                                       │
  │  ─────────────────────────────                                           │
  │                                                                          │
  │  For each bit position i in r[14:0]:                                     │
  │                                                                          │
  │  Bit│Shift│ Partial Product Formation                                    │
  │  ───┼─────┼──────────────────────────────────────                        │
  │  14 │ <<5 │ {d[12:0], 5'h0}        (truncate MSBs)                       │
  │  13 │ <<4 │ {d[13:0], 4'h0}                                              │
  │  12 │ <<3 │ {d[14:0], 3'h0}                                              │
  │  11 │ <<2 │ {d[15:0], 2'h0}                                              │
  │  10 │ <<1 │ {s, d[15:0], 1'h0}     (sign extend)                         │
  │   9 │ <<0 │ {s, s, d[15:0]}                                              │
  │   8 │ >>1 │ {s, s, s, d[15:1]}                                           │
  │   7 │ >>2 │ {s, s, s, s, d[15:2]}                                        │
  │  ... continuing pattern ...                                              │
  │   0 │ >>9 │ {s×11, d[15:9]}                                              │
  │                                                                          │
  │  Step 3: Sum all partial products + rounding                             │
  │  ───────────────────────────────────────────                             │
  │  sum = 3 + Σ(partial products)                                           │
  │        ↑                                                                 │
  │     0.75 LSB for rounding                                                │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    PARTIAL PRODUCT ALIGNMENT                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  18-bit accumulator format:                                              │
  │  ┌──────────────────────────────────┬───┐                                │
  │  │         16-bit product           │RND│                                │
  │  └──────────────────────────────────┴───┘                                │
  │   17                               2  1 0                                │
  │                                                                          │
  │  Alignment for r[11] (binary point aligned):                             │
  │                                                                          │
  │  Multiplicand d:    SIIII.FFFFFFFFFFF                                    │
  │  Shifted << 2:    SIIII.FFFFFFFFFFF00                                    │
  │  In 18-bit sum:   III.FFFFFFFFFFF00                                      │
  │                      ↑                                                   │
  │                 Binary point                                             │
  │                                                                          │
  │  Upper bits (r[14:11]): Left shift, may overflow                         │
  │  Middle bit (r[10]):    Aligned at binary point                          │
  │  Lower bits (r[9:0]):   Right shift, fractional only                     │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      SYNTHESIS CHARACTERISTICS                           │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Resource usage (typical FPGA):                                          │
  │  • ~200-300 LUTs for partial product generation                          │
  │  • ~100-150 LUTs for 15-input adder tree                                 │
  │  • 0 flip-flops (purely combinational)                                   │
  │                                                                          │
  │  Timing:                                                                 │
  │  • Critical path: ~15 LUT delays (adder tree depth)                      │
  │  • Typical Fmax: 100-200 MHz on modern FPGAs                             │
  │                                                                          │
  │  Optimizations:                                                          │
  │  • Constant folding removes zero partial products                        │
  │  • Synthesis tools balance adder tree automatically                      │
  │  • Sign extension chains can be optimized                                │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLE                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Mandelbrot iteration hardware                                        │
  │  reg signed [15:0] zr, zi;      // Current z (real, imaginary)           │
  │  reg signed [15:0] cr, ci;      // Constant c                            │
  │  wire signed [15:0] zr2, zi2;   // z squared components                  │
  │  wire signed [15:0] zr_next;    // Next iteration                        │
  │                                                                          │
  │  // Calculate zr² and zi²                                                │
  │  fmul mult_zr2 (.md(zr), .mr(zr), .out(zr2));  // zr²                    │
  │  fmul mult_zi2 (.md(zi), .mr(zi), .out(zi2));  // zi²                    │
  │                                                                          │
  │  // Next real part: zr² - zi² + cr                                       │
  │  assign zr_next = zr2 - zi2 + cr;                                        │
  │                                                                          │
  │  // For imaginary part, need 2×zr×zi                                     │
  │  wire signed [15:0] zr_zi, zi_next;                                      │
  │  fmul mult_cross (.md(zr), .mr(zi), .out(zr_zi));                        │
  │  assign zi_next = {zr_zi[14:0], 1'b0} + ci;  // ×2 via shift             │
  │                                                                          │
  │  // Escape detection: |z|² > 4                                           │
  │  wire escape = (zr2[15:13] != 3'b000 && zr2[15:13] != 3'b111) ||         │
  │                (zi2[15:13] != 3'b000 && zi2[15:13] != 3'b111);           │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/ 

module fmul(
  input  [15:0]md,  // Multiplicand
  input  [15:0]mr,  // Multiplier
  output   [15:0]out  // Product
);

wire [15:0]d;    // Multiplicand (sign adjusted)
wire [14:0]r;    // Multiplier (positive)
wire [17:0]sum;    // result with 2 extra bits

// Make multiplier positive
assign r=mr[15]? ((~mr[14:0])+1) : mr[14:0];
assign d=mr[15]? ((~md)+1) : md;

wire s;  // sign bit of multiplicand
assign s=d[15];

assign sum= 18'h3 +    // (= 0.75 LSB) for rounding instead of truncating
 (r[14]? {d[12:0],5'h0}: 18'h0) +
 (r[13]? {d[13:0],4'h0}: 18'h0) +
 (r[12]? {d[14:0],3'h0}: 18'h0) +
 (r[11]? {d[15:0],2'h0}: 18'h0) +
 (r[10]? {s,d[15:0],1'h0}: 18'h0) +
 (r[9]?  {s,s,d[15:0]}: 18'h0) +
 (r[8]?  {s,s,s,d[15:1]}: 18'h0) +
 (r[7]?  {s,s,s,s,d[15:2]}: 18'h0) +
 (r[6]?  {s,s,s,s,s,d[15:3]}: 18'h0) +
 (r[5]?  {s,s,s,s,s,s,d[15:4]}: 18'h0) +
 (r[4]?  {s,s,s,s,s,s,s,d[15:5]}: 18'h0) +
 (r[3]?  {s,s,s,s,s,s,s,s,d[15:6]}: 18'h0) +
 (r[2]?  {s,s,s,s,s,s,s,s,s,d[15:7]}: 18'h0) +
 (r[1]?  {s,s,s,s,s,s,s,s,s,s,d[15:8]}: 18'h0) +
 (r[0]?  {s,s,s,s,s,s,s,s,s,s,s,d[15:9]}: 18'h0) ;
  
assign out=sum[17:2];

endmodule

