/***| fix_mpy.v |
 
  Copyright (c) 2025 Jesús Arias
  Web: https://www.ele.uva.es/~jesus

  --
   Documentation improved by Carlos Venegas 
   X: @cavearr / Github: @cavearr / FPGAwars: charliva@gmail.com
  --

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                   FIXED-POINT FRACTIONAL MULTIPLIER                      │
  │                       (DW bits - FRAC_BITS bits)                         │
  │                                                                          │
  │  Signed fixed-point multiplication with configurable fractional          │
  │  precision using shift-and-add algorithm                                 │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module implements signed fixed-point multiplication with:          ║
  ║                                                                          ║
  ║  • Configurable data width and fractional bits                           ║
  ║  • Sign-magnitude conversion for simplified partial products             ║
  ║  • Shift-and-add architecture with truncation relief                     ║
  ║  • Optimized for area efficiency in FPGA/ASIC                            ║
  ║  • Proper rounding by adding 3 LSBs before truncation                    ║
  ║  • Combinational design (single-cycle operation)                         ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         FIXED-POINT FORMAT                               │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Number representation (DW = 16, FRAC_BITS = 11):                        │
  │                                                                          │
  │  ┌────┬────┬────┬────┬─────────────────────────────────┐                 │
  │  │Sign│ Integer bits │         Fractional bits         │                 │
  │  └────┴────┴────┴────┴─────────────────────────────────┘                 │
  │   15   14  13  12  11  10  9  8  7  6  5  4  3  2  1  0                  │
  │   └─┘  └──────┬─────┘  └───────────┬──────────────────┘                  │
  │    1       NIN-1=4            FRAC_BITS=11                               │
  │                                                                          │
  │  Value range:                                                            │
  │  • Integer part: -2^(NIN-1) to 2^(NIN-1)-1                               │
  │  • Fractional resolution: 2^(-FRAC_BITS)                                 │
  │  • Example: [-16.0, 15.999] with resolution 0.00048828                   │
  │                                                                          │
  │  Binary point position:                                                  │
  │  ───────────────────────                                                 │
  │  SIIII.FFFFFFFFFFF                                                       │
  │       ↑                                                                  │
  │    Binary point                                                          │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      MULTIPLICATION ALGORITHM                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Step 1: Sign Processing                                                 │
  │  ──────────────────────                                                  │
  │  • Convert multiplier (mr) to positive: r = |mr|                         │
  │  • Conditionally negate multiplicand: d = (mr<0) ? -md : md              │
  │  • This ensures correct sign in final result                             │
  │                                                                          │
  │  Step 2: Shift-and-Add Multiplication                                    │
  │  ────────────────────────────────────                                    │
  │                                                                          │
  │  For each bit i in r (from MSB to LSB):                                  │
  │    if r[i] == 1:                                                         │
  │      Add d shifted left by (DW-2-i) positions                            │
  │                                                                          │
  │  Example for 4-bit multiplication:                                       │
  │  ─────────────────────────────────                                       │
  │  md = 0101 (5), mr = 0011 (3)                                            │
  │  r = 0011, d = 0101                                                      │
  │                                                                          │
  │  r[2]=0: skip                                                            │
  │  r[1]=1: add 0101 << 0 = 0101                                            │
  │  r[0]=1: add 0101 << 1 = 1010                                            │
  │  Result: 0101 + 1010 = 1111 (15)                                         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                   PARTIAL PRODUCT GENERATION                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Extended precision for accurate rounding:                               │
  │                                                                          │
  │  Internal width = DW + NIN + 2 bits                                      │
  │  ┌──────────────┬──────────────┬────┐                                    │
  │  │ Integer ext. │ Original DW  │ +2 │                                    │
  │  └──────────────┴──────────────┴────┘                                    │
  │     Sign ext.      Product      Round                                    │
  │                                                                          │
  │  Partial product alignment:                                              │
  │  ─────────────────────────                                               │
  │                                                                          │
  │  Case 1: i < NIN (padding right)                                         │
  │  ┌────────┬──────────┬────────┐                                          │
  │  │Sign ext│    d     │ Zeros  │                                          │
  │  └────────┴──────────┴────────┘                                          │
  │    i bits    DW bits  NIN-i                                              │
  │                                                                          │
  │  Case 2: i ≥ NIN (truncating right)                                      │
  │  ┌────────┬──────────────────┐                                           │
  │  │Sign ext│ d[DW-1:i-NIN]    │                                           │
  │  └────────┴──────────────────┘                                           │
  │   i+1 bits   Truncated d                                                 │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      ROUNDING AND TRUNCATION                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Rounding strategy:                                                      │
  │  ─────────────────                                                       │
  │  • Initialize accumulator with 3 (binary 011)                            │
  │  • This adds 0.75 LSB for better rounding accuracy                       │
  │  • Equivalent to round-to-nearest for positive results                   │
  │                                                                          │
  │  Final truncation:                                                       │
  │  ────────────────                                                        │
  │  Extended result: [.....PPPPPPPPPPPPPPPP.RR]                             │
  │                         └──────┬────────┘ ↓                              │
  │                           Keep these    Discard                          │
  │                                                                          │
  │  out = tsum[DW-2][DW+1:2]  // Extract DW bits                            │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    IMPLEMENTATION ARCHITECTURE                           │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Adder tree structure:                                                   │
  │                                                                          │
  │  tsum[1] ─┐                                                              │
  │           ├─[+]─ tsum[2] ─┐                                              │
  │  PP[2] ───┘               ├─[+]─ tsum[3] ─┐                              │
  │              PP[3] ───────┘               ├─[+]─ ... → out               │
  │                             PP[4] ────────┘                              │
  │                                                                          │
  │  Critical path: O(log(DW)) adder delays                                  │
  │  Area: O(DW²) due to partial product generation                          │
  │                                                                          │
  │  Synthesis optimizations:                                                │
  │  • Constant propagation removes unused upper bits                        │
  │  • Resource sharing between partial products                             │
  │  • Adder tree balancing by synthesis tools                               │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLES                                  │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Example 1: 16-bit Q4.11 format multiplier                            │
  │  fix_mpy #(                                                              │
  │      .DW(16),              // 16-bit data width                          │
  │      .FRAC_BITS(11)        // 11 fractional bits                         │
  │  ) q4_11_mult (                                                          │
  │      .md(operand_a),       // Q4.11 multiplicand                         │
  │      .mr(operand_b),       // Q4.11 multiplier                           │
  │      .out(product)         // Q4.11 product                              │
  │  );                                                                      │
  │                                                                          │
  │  // Example 2: Convert to/from fixed-point                               │
  │  real a_real = 3.14159;                                                  │
  │  real b_real = 2.71828;                                                  │
  │                                                                          │
  │  // Convert to Q4.11                                                     │
  │  wire [15:0] a_fixed = a_real * (1 << 11);  // 6434                      │
  │  wire [15:0] b_fixed = b_real * (1 << 11);  // 5567                      │
  │                                                                          │
  │  // Multiply                                                             │
  │  wire [15:0] c_fixed;                                                    │
  │  fix_mpy mult (.md(a_fixed), .mr(b_fixed), .out(c_fixed));               │
  │                                                                          │
  │  // Convert back to real                                                 │
  │  real c_real = c_fixed / (1 << 11.0);  // ≈ 8.539                        │
  │                                                                          │
  │  // Example 3: DSP filter coefficient                                    │
  │  parameter signed [15:0] COEFF = 16'h0666;  // 0.8 in Q4.11              │
  │  reg signed [15:0] signal;                                               │
  │  wire signed [15:0] filtered;                                            │
  │                                                                          │
  │  fix_mpy filter_mult (                                                   │
  │      .md(signal),                                                        │
  │      .mr(COEFF),                                                         │
  │      .out(filtered)        // signal × 0.8                               │
  │  );                                                                      │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/


module fix_mpy #(
    parameter DW = 16,        // Data Width (bits)
    parameter FRAC_BITS = 11  // Number of bits for fractional part
) (
    input  [DW-1:0] md,  // Multiplicand (signed)
    input  [DW-1:0] mr,  // Multiplier   (signed)
    output [DW-1:0] out  // Product      (signed)
);

localparam NIN = DW-FRAC_BITS;  // Bits of the integer part, minimun=1 (sign bit)

wire [DW-1:0]d;    // Multiplicand (sign adjusted)
wire [DW-2:0]r;    // Multiplier (positive)

// Make multiplier positive
assign r=mr[DW-1]? ((~mr[DW-2:0])+1) : mr[DW-2:0];
assign d=mr[DW-1]? ((~md)+1) : md;

wire s;  // sign bit of multiplicand
assign s=d[DW-1];
// intermediate adder results, with extra width:
// + 2 bits on the rigth for truncation relief
// + (NIN-2) bits on the left for the integer bits (not really connected and removed by Yosys)
/* verilator lint_off UNOPTFLAT */
wire [DW+NIN:0]tsum[1:DW-2];  
generate
  genvar i;
  // Two MSBs of the product...
  if (NIN>1) // more than 1 bit in the integer part
    assign tsum[1]= 3 +     
      (r[DW-2] ? {    d[DW-1:0],{{(NIN){1'b0}}}}: 'h0) +
      (r[DW-3] ? { s, d[DW-1:0],{{(NIN-1){1'b0}}}}: 'h0) ;
  else      // Just the sign bit in the integer part 
    assign tsum[1]= 3 +     
      (r[DW-2] ? { s, d[DW-1:0],1'b0}: 'h0) +
      (r[DW-3] ? { s, s, d[DW-1:0]}: 'h0) ;
    
  // ... and remaining bits
  for (i=2; i<=NIN; i=i+1)    // padding on the right
    assign tsum[i] = tsum[i-1] + ( r[DW-2-i] ?  {{(i){s}}, d[DW-1:0],{(NIN-i){1'b0}}} : 'h0 );
  for (i=NIN+1; i<DW-1; i=i+1) // Truncation on the rigth
     assign tsum[i] = tsum[i-1] + ( r[DW-2-i] ?  {{(i+(NIN<2)){s}}, d[DW-1:i-NIN] } : 'h0 );
endgenerate

assign out=tsum[DW-2][DW+1:2]; // remove extra bits from result
/* verilator lint_on UNOPTFLAT */
endmodule
