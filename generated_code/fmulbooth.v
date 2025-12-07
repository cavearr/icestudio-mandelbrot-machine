/***| fmulbooth.v |

  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com
 
  This work is dedicated to the public domain under the Creative Commons 
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s) 
  have waived all copyright and related or neighboring rights to this work 
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/
 
  -- Citing authorship is a personal ethical decision -- 
  
  ┌─────────────────────────────────────────────────────────────────────────┐
  │                    BOOTH FIXED-POINT MULTIPLIER                         │
  │                                                                         │
  │  Implements Booth's radix-4 multiplication algorithm for fixed-point    │
  │  numbers with configurable data width and fractional bits.              │
  └─────────────────────────────────────────────────────────────────────────┘
 
  ╔═══════════════════════════════════════════════════════════════════════╗
  ║                        ALGORITHM OVERVIEW                             ║
  ╠═══════════════════════════════════════════════════════════════════════╣
  ║                                                                       ║
  ║  Booth's algorithm reduces the number of partial products by          ║
  ║  examining groups of bits in the multiplier. This implementation      ║
  ║  uses radix-4 (examines 3 bits at a time) to generate N/2 partial     ║
  ║  products instead of N.                                               ║
  ║                                                                       ║
  ║  Key advantages:                                                      ║
  ║  • Reduces hardware complexity (fewer adders)                         ║
  ║  • Handles signed multiplication naturally                            ║
  ║  • Efficient for fixed-point arithmetic                               ║
  ╚═══════════════════════════════════════════════════════════════════════╝
 
  ┌─────────────────────────────────────────────────────────────────────────┐
  │                         FIXED-POINT FORMAT                              │
  ├─────────────────────────────────────────────────────────────────────────┤
  │                                                                         │
  │  Input format (DW bits total):                                          │
  │  ┌────┬─────────────────────┬────────────────────────┐                  │
  │  │Sign│  Integer bits       │   Fractional bits      │                  │
  │  └────┴─────────────────────┴────────────────────────┘                  │
  │    1      (DW-FRAC_BITS-1)         FRAC_BITS                            │
  │                                                                         │
  │  Example for DW=16, FRAC_BITS=11:                                       │
  │  ┌────┬────┬────────────────────────┐                                   │
  │  │ S  │ I₃ │ F₁₀ F₉ F₈ ... F₁ F₀   │                                    │
  │  └────┴────┴────────────────────────┘                                   │
  │   15   14-11        10-0                                                │
  │                                                                         │
  │  Value = (-1)^S × (I + F/2^FRAC_BITS)                                   │
  └─────────────────────────────────────────────────────────────────────────┘
 
  ┌─────────────────────────────────────────────────────────────────────────┐
  │                      BOOTH ENCODING TABLE                               │
  ├─────────────────────────────────────────────────────────────────────────┤
  │                                                                         │
  │  Multiplier bits │ Operation │ Partial Product                          │
  │  ────────────────┼───────────┼─────────────────                         │
  │  mr[2i+1:2i-1]   │           │                                          │
  │  ────────────────┼───────────┼─────────────────                         │
  │      000         │    0      │    0                                     │
  │      001         │   +1×md   │   +md                                    │
  │      010         │   +1×md   │   +md                                    │
  │      011         │   +2×md   │   +2×md                                  │
  │      100         │   -2×md   │   -2×md                                  │
  │      101         │   -1×md   │   -md                                    │
  │      110         │   -1×md   │   -md                                    │
  │      111         │    0      │    0                                     │
  │                                                                         │
  │  Note: mr[-1] = 0 (implicit zero before LSB)                            │
  └─────────────────────────────────────────────────────────────────────────┘
 
  ┌─────────────────────────────────────────────────────────────────────────┐
  │                    MULTIPLICATION PROCESS                               │
  ├─────────────────────────────────────────────────────────────────────────┤
  │                                                                         │
  │  Step 1: Generate partial products                                      │
  │  ────────────────────────────────────                                   │
  │                                                                         │
  │  For i = 0 to (DW/2)-1:                                                 │
  │    Examine bits: mr[2i+1], mr[2i], mr[2i-1]                             │
  │    Generate PP[i] based on Booth encoding                               │
  │    Shift PP[i] left by 2×i positions                                    │
  │                                                                         │
  │  Example for 8-bit multiplication:                                      │
  │                                                                         │
  │  Multiplier: b₇b₆b₅b₄b₃b₂b₁b₀                                           │
  │              └─┴─┘└─┴─┘└─┴─┘└─┴─┘                                       │
  │              Group3 Group2 Group1 Group0                                │
  │                                                                         │
  │  PP[0] = Booth(b₁b₀,0)     << 0                                         │
  │  PP[1] = Booth(b₃b₂b₁)     << 2                                         │
  │  PP[2] = Booth(b₅b₄b₃)     << 4                                         │
  │  PP[3] = Booth(b₇b₆b₅)     << 6                                         │
  │                                                                         │
  │  Step 2: Sum all partial products                                       │
  │  ────────────────────────────────                                       │
  │                                                                         │
  │            PP[0]:    xxxxxxxxxx                                         │
  │            PP[1]:  xxxxxxxxxx00                                         │
  │            PP[2]: xxxxxxxxxx0000                                        │
  │            PP[3]:xxxxxxxxxx000000                                       │
  │  Rounding:                  +011  (0.75 LSB)                            │
  │            ─────────────────────────                                    │
  │            Sum:  xxxxxxxxxxxxxxxx                                       │
  │                                                                         │
  │  Step 3: Extract result with proper alignment                           │
  │  ────────────────────────────────────────────                           │
  │                                                                         │
  │  Full product (2×DW bits):                                              │
  │  ┌────────────────────┬────────────────────┐                            │
  │  │   Upper DW bits    │   Lower DW bits    │                            │
  │  └────────────────────┴────────────────────┘                            │
  │                                                                         │
  │  Extract DW bits starting at position FRAC_BITS:                        │
  │  Result = Sum[DW+FRAC_BITS-1:FRAC_BITS]                                 │
  └─────────────────────────────────────────────────────────────────────────┘
 
  ┌─────────────────────────────────────────────────────────────────────────┐
  │                         ROUNDING STRATEGY                               │
  ├─────────────────────────────────────────────────────────────────────────┤
  │                                                                         │
  │  This implementation uses biased rounding with 0.75 LSB offset:         │
  │                                                                         │
  │  • Adds 3'b011 (0.75 in binary) to the LSB position                     │
  │  • Reduces average rounding error                                       │
  │  • Provides better accuracy for fixed-point arithmetic                  │
  │                                                                         │
  │  Rounding behavior:                                                     │
  │  ─────────────────                                                      │
  │  Fractional part < 0.25 → Round down                                    │
  │  Fractional part ≥ 0.25 → Round up                                      │
  └─────────────────────────────────────────────────────────────────────────┘
 ***/

module fmulbooth #(
    parameter DW = 16,       // Data width
    parameter FRAC_BITS = 11 // Number of fractional bits
) (
    input  [DW-1:0] md,     // Multiplicand
    input  [DW-1:0] mr,     // Multiplier
    output [DW-1:0] out     // Product
);
    // Internal wires
    wire [2*DW-1:0] partial_products[0:(DW/2)-1]; // Partial products (2*DW bits)
    wire [2*DW-1:0] sum;                          // Sum of partial products

    // Generate partial products using Booth's algorithm
    // https://en.wikipedia.org/wiki/Booth%27s_multiplication_algorithm
    genvar i;
    generate
        for (i = 0; i < DW/2; i = i + 1) begin : booth_step
            // Examine 3 bits: mr[2i+1], mr[2i], mr[2i-1] (with mr[-1] = 0, mr[DW] = mr[DW-1])
            wire [1:0] curr_bits = (i == 0) ? {mr[0], 1'b0} : 
                                   (2*i+1 < DW) ? mr[2*i+1:2*i] : {2{mr[DW-1]}};
            wire prev_bit = (i == 0) ? 1'b0 : mr[2*i-1];
            wire [2:0] booth_bits = {curr_bits, prev_bit};

            // Booth encoding: decide +md, -md, +2*md, -2*md, or 0
            reg [DW+1:0] pp; // Partial product (DW+2 bits to handle sign and shift)
            always @(*) begin
                case (booth_bits)
                    3'b000, 3'b111: pp = {(DW+2){1'b0}};           // 0
                    3'b001, 3'b010: pp = {{2{md[DW-1]}}, md};      // +md
                    3'b011:         pp = {{1{md[DW-1]}}, md, 1'b0}; // +2*md
                    3'b100:         pp = ~({{1{md[DW-1]}}, md, 1'b0}) + 1; // -2*md
                    3'b101, 3'b110: pp = ~({{2{md[DW-1]}}, md}) + 1; // -md
                    default:        pp = {(DW+2){1'b0}};           // 0
                endcase
            end

            // Shift partial product by 2*i bits and sign-extend to 2*DW bits
            assign partial_products[i] = {{(DW-2-2*i){pp[DW+1]}}, pp, {(2*i){1'b0}}};
        end
    endgenerate

    // Dynamically sum all partial products with rounding offset (0.75 LSB)
    reg [2*DW-1:0] sum_temp;
    integer j;
    always @(*) begin
        sum_temp = {{(2*DW-3){1'b0}}, 3'b011}; // Initialize with 0.75 LSB offset
        for (j = 0; j < DW/2; j = j + 1) begin
            sum_temp = sum_temp + partial_products[j];
        end
    end
    assign sum = sum_temp;

    // Truncate to DW bits, aligning fixed-point format
    assign out = sum[DW+FRAC_BITS-1:FRAC_BITS];
endmodule
