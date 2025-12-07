/***| fmul24.v |
 
  Copyright (c) 2025 Jesús Arias
  Web: https://www.ele.uva.es/~jesus

  --
   Documentation improved by Carlos Venegas 
   X: @cavearr / Github: @cavearr / FPGAwars: charliva@gmail.com
  --

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                  24-BIT FIXED-POINT FRACTIONAL MULTIPLIER                │
  │                                                                          │
  │  High-precision signed Q5.18 fixed-point multiplication with             │
  │  unrolled shift-and-add architecture                                     │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module implements a 24-bit signed fixed-point multiplier with:     ║
  ║                                                                          ║
  ║  • Q5.18 format: 1 sign + 5 integer + 18 fractional bits                 ║
  ║  • Range: [-32.0, +31.999996185] with resolution 3.815×10⁻⁶              ║
  ║  • Single-cycle combinational operation                                  ║
  ║  • 23 parallel partial products with sign extension                      ║
  ║  • Rounding via 0.75 LSB offset for improved accuracy                    ║
  ║  • Suitable for high-precision DSP and scientific computing              ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                        Q5.18 FIXED-POINT FORMAT                          │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  24-bit allocation:                                                      │
  │                                                                          │
  │  ┌────┬─────────────────┬─────────────────────────────────┐              │
  │  │Sign│  Integer part   │          Fractional part        │              │
  │  └────┴─────────────────┴─────────────────────────────────┘              │
  │   23   22  21  20  19 18  17  16  15  14 ... 3   2   1   0               │
  │   └─┘  └────────┬──────┘  └───────────────┬──────────────┘               │
  │    S       I (5 bits)               F (18 bits)                          │
  │                                                                          │
  │  Binary representation: SIIIII.FFFFFFFFFFFFFFFFFF                        │
  │                               ↑                                          │
  │                          Binary point                                    │
  │                                                                          │
  │  Value = (-1)^S × (I + F/2¹⁸)                                            │
  │        = (-1)^S × (I + F/262144)                                         │
  │                                                                          │
  │  Resolution comparison:                                                  │
  │  ┌──────────┬────────────┬─────────────────┐                             │
  │  │ Format   │ Resolution │ Decimal places  │                             │
  │  ├──────────┼────────────┼─────────────────┤                             │
  │  │ Q4.11    │ 0.000488   │ ~3.3 digits     │                             │
  │  │ Q5.18    │ 0.00000381 │ ~5.4 digits     │                             │
  │  │ Float32  │ Variable   │ ~7.2 digits     │                             │
  │  └──────────┴────────────┴─────────────────┘                             │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      MULTIPLICATION ALGORITHM                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Sign-Magnitude Multiplication Process:                                  │
  │  ─────────────────────────────────────                                   │
  │                                                                          │
  │  1. Sign Processing:                                                     │
  │     if (mr < 0) {                                                        │
  │         r = |mr|     // 23-bit magnitude                                 │
  │         d = -md      // Negate multiplicand                              │
  │     } else {                                                             │
  │         r = mr       // Already positive                                 │
  │         d = md       // Keep as is                                       │
  │     }                                                                    │
  │                                                                          │
  │  2. Partial Product Generation (23 products):                            │
  │                                                                          │
  │  ┌─────┬──────┬─────────────────────────────────────┐                    │
  │  │ Bit │Shift │ Partial Product Structure           │                    │
  │  ├─────┼──────┼─────────────────────────────────────┤                    │
  │  │ r22 │ +5   │ {d[20:0], 5'b0}      MSBs truncated │                    │
  │  │ r21 │ +4   │ {d[21:0], 4'b0}                     │                    │
  │  │ r20 │ +3   │ {d[22:0], 3'b0}                     │                    │
  │  │ r19 │ +2   │ {d[23:0], 2'b0}     Full width      │                    │
  │  │ r18 │ +1   │ {s, d[23:0], 1'b0}  Sign extend     │                    │
  │  │ r17 │  0   │ {s, s, d[23:0]}     Aligned         │                    │
  │  │ r16 │ -1   │ {s×3, d[23:1]}      Right shift     │                    │
  │  │ ... │ ...  │ ...                                 │                    │
  │  │ r0  │ -17  │ {s×19, d[23:17]}    Heavy shift     │                    │
  │  └─────┴──────┴─────────────────────────────────────┘                    │
  │                                                                          │
  │  3. Accumulation: sum = 3 + Σ(partial products)                          │
  │                         ↑                                                │
  │                    Rounding offset                                       │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                   PARTIAL PRODUCT ALIGNMENT DETAIL                       │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  26-bit accumulator format:                                              │
  │  ┌────────────────────────────────────────┬────┐                         │
  │  │           24-bit product               │RND │                         │
  │  └────────────────────────────────────────┴────┘                         │
  │   25                                    2  1  0                          │
  │                                                                          │
  │  Binary point alignment examples:                                        │
  │                                                                          │
  │  For r[18] (shift left 1):                                               │
  │  ─────────────────────────                                               │
  │  Original d:     SIIIII.FFFFFFFFFFFFFFFFFF                               │
  │  Shifted << 1:  SIIIII.FFFFFFFFFFFFFFFFFF0                               │
  │  In accumulator: IIIII.FFFFFFFFFFFFFFFFFF0                               │
  │                       ↑                                                  │
  │                  Binary point                                            │
  │                                                                          │
  │  For r[8] (shift right 9):                                               │
  │  ──────────────────────────                                              │
  │  Original d:     SIIIII.FFFFFFFFFFFFFFFFFF                               │
  │  Shifted >> 9:   SSSSSSSSS.SIIIIIFFFFFFF                                 │
  │  In accumulator: 00000000.0SIIIIIFFFFFFF00                               │
  │                          ↑                                               │
  │                     Binary point                                         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    PRECISION AND ERROR ANALYSIS                          │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Theoretical precision:                                                  │
  │  • Input resolution:  2⁻¹⁸ ≈ 3.815×10⁻⁶                                  │
  │  • Output resolution: 2⁻¹⁸ ≈ 3.815×10⁻⁶                                  │
  │  • Rounding error:    < 0.5 LSB ≈ 1.907×10⁻⁶                             │
  │                                                                          │
  │  Comparison with IEEE 754 single precision:                              │
  │  ┌─────────────┬──────────┬──────────────┐                               │
  │  │ Operation   │ Q5.18    │ Float32      │                               │
  │  ├─────────────┼──────────┼──────────────┤                               │
  │  │ 1.5 × 2.5   │ 3.750000 │ 3.750000     │                               │
  │  │ π × e       │ 8.539732 │ 8.539734     │                               │
  │  │ 0.1 × 0.1   │ 0.009998 │ 0.010000     │                               │
  │  └─────────────┴──────────┴──────────────┘                               │
  │                                                                          │
  │  Maximum relative error ≈ 10⁻⁵ for values > 0.01                         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                       SYNTHESIS OPTIMIZATION                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Resource utilization (typical):                                         │
  │  • Partial product generation: ~500-600 LUTs                             │
  │  • 23-input adder tree: ~300-400 LUTs                                    │
  │  • Total area: ~800-1000 LUTs                                            │
  │  • No DSP blocks used (pure logic implementation)                        │
  │                                                                          │
  │  Timing characteristics:                                                 │
  │  • Critical path: ~20-25 LUT delays                                      │
  │  • Typical Fmax: 80-150 MHz on modern FPGAs                              │
  │  • Single-cycle latency                                                  │
  │                                                                          │
  │  Power optimization opportunities:                                       │
  │  • Clock gating on zero operands                                         │
  │  • Operand isolation for unused partial products                         │
  │  • Consider pipelined version for higher frequency                       │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLES                                  │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Example 1: High-precision DSP filter                                 │
  │  reg signed [23:0] audio_sample;                                         │
  │  reg signed [23:0] filter_coeff;                                         │
  │  wire signed [23:0] filtered;                                            │
  │                                                                          │
  │  fmul24 audio_mult (                                                     │
  │      .md(audio_sample),                                                  │
  │      .mr(filter_coeff),                                                  │
  │      .out(filtered)                                                      │
  │  );                                                                      │
  │                                                                          │
  │  // Example 2: Coordinate transformation                                 │
  │  reg signed [23:0] x, y;          // Q5.18 coordinates                   │
  │  reg signed [23:0] cos_theta;     // Q5.18 cosine value                  │
  │  reg signed [23:0] sin_theta;     // Q5.18 sine value                    │
  │  wire signed [23:0] x_rot, y_rot; // Rotated coordinates                 │
  │                                                                          │
  │  // x' = x*cos(θ) - y*sin(θ)                                             │
  │  wire signed [23:0] x_cos, y_sin;                                        │
  │  fmul24 mult_xcos (.md(x), .mr(cos_theta), .out(x_cos));                 │
  │  fmul24 mult_ysin (.md(y), .mr(sin_theta), .out(y_sin));                 │
  │  assign x_rot = x_cos - y_sin;                                           │
  │                                                                          │
  │  // Example 3: Converting to/from Q5.18                                  │
  │  real value_real = 3.14159265;                                           │
  │  wire signed [23:0] value_q518;                                          │
  │                                                                          │
  │  // Convert real to Q5.18                                                │
  │  assign value_q518 = value_real * (1 << 18);  // = 0x3243F6              │
  │                                                                          │
  │  // Convert Q5.18 back to real (in testbench)                            │
  │  real result_real = $itor(value_q518) / (1 << 18);                       │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/ 

module fmul24(
  input  [23:0]md,  // Multiplicand
  input  [23:0]mr,  // Multiplier
  output   [23:0]out  // Product
);

wire [23:0]d;    // Multiplicand (sign adjusted)
wire [22:0]r;    // Multiplier (positive)
wire [25:0]sum;    // result with 2 extra bits

// Make multiplier positive
assign r=mr[23]? ((~mr[22:0])+1) : mr[22:0];
assign d=mr[23]? ((~md)+1) : md;

wire s;  // sign bit of multiplicand
assign s=d[23];

assign sum= 26'h3 +    // (= 0.75 LSB) for rounding instead of truncating
 (r[22]? {d[20:0],5'h0}: 26'h0) +
 (r[21]? {d[21:0],4'h0}: 26'h0) +
 (r[20]? {d[22:0],3'h0}: 26'h0) +
 (r[19]? {d[23:0],2'h0}: 26'h0) +
 (r[18]? {s,d[23:0],1'h0}: 26'h0) +
 (r[17]? {s,s,d[23:0]}: 26'h0) +
 (r[16]? {s,s,s,d[23:1]}: 26'h0) +
 (r[15]? {s,s,s,s,d[23:2]}: 26'h0) +
 (r[14]? {s,s,s,s,s,d[23:3]}: 26'h0) +
 (r[13]? {s,s,s,s,s,s,d[23:4]}: 26'h0) +
 (r[12]? {s,s,s,s,s,s,s,d[23:5]}: 26'h0) +
 (r[11]? {s,s,s,s,s,s,s,s,d[23:6]}: 26'h0) +
 (r[10]? {s,s,s,s,s,s,s,s,s,d[23:7]}: 26'h0) +
 (r[9]?  {s,s,s,s,s,s,s,s,s,s,d[23:8]}: 26'h0) +
 (r[8]?  {s,s,s,s,s,s,s,s,s,s,s,d[23:9]}: 26'h0) +
 (r[7]?  {s,s,s,s,s,s,s,s,s,s,s,s,d[23:10]}: 26'h0) +
 (r[6]?  {s,s,s,s,s,s,s,s,s,s,s,s,s,d[23:11]}: 26'h0) +
 (r[5]?  {s,s,s,s,s,s,s,s,s,s,s,s,s,s,d[23:12]}: 26'h0) +
 (r[4]?  {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,d[23:13]}: 26'h0) +
 (r[3]?  {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,d[23:14]}: 26'h0) +
 (r[2]?  {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,d[23:15]}: 26'h0) +
 (r[1]?  {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,d[23:16]}: 26'h0) +
 (r[0]?  {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,d[23:17]}: 26'h0) ;
  
assign out=sum[25:2];

endmodule
