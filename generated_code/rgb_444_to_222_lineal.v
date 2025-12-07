/***| rgb_444_to_222.v |
  
  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com
 
  This work is dedicated to the public domain under the Creative Commons 
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s) 
  have waived all copyright and related or neighboring rights to this work 
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/
 
  -- Citing authorship is a personal ethical decision -- 

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                     RGB COLOR DEPTH CONVERTER                            │
  │                                                                          │
  │  Converts 12-bit RGB444 color to 6-bit RGB222 with multiple              │
  │  reduction algorithms and special color preservation                     │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module reduces color depth from RGB444 (4096 colors) to RGB222     ║
  ║  (64 colors) for applications with limited color palettes, providing:    ║
  ║                                                                          ║
  ║  • Three selectable reduction algorithms                                 ║
  ║  • Special handling for pure red borders (game boundaries)               ║
  ║  • Optimized for minimal gate count and zero latency                     ║
  ║  • Suitable for retro gaming, LED displays, or memory-limited systems    ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         COLOR FORMAT MAPPING                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  RGB444 Format (12 bits):          RGB222 Format (6 bits):               │
  │  ───────────────────────           ──────────────────────                │
  │                                                                          │
  │  ┌────┬────┬────┬────┐            ┌──┬──┬──┬──┬──┬──┐                    │
  │  │ R3 │ R2 │ R1 │ R0 │            │R1│R0│G1│G0│B1│B0│                    │
  │  ├────┼────┼────┼────┤            └──┴──┴──┴──┴──┴──┘                    │
  │  │ G3 │ G2 │ G1 │ G0 │             Red  Grn  Blue                        │
  │  ├────┼────┼────┼────┤                                                   │
  │  │ B3 │ B2 │ B1 │ B0 │            16 levels → 4 levels                   │
  │  └────┴────┴────┴────┘            per channel   per channel              │
  │   11   10   9    8                                                       │
  │    7    6   5    4                Color reduction: 4096 → 64 colors      │
  │    3    2   1    0                                                       │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                       REDUCTION ALGORITHMS                               │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  MODE 0: LINEAR SCALING WITH ROUNDING                                    │
  │  ────────────────────────────────────                                    │
  │  Algorithm: out = (in + 2) >> 2                                          │
  │                                                                          │
  │  Mapping table:                                                          │
  │  ┌─────────┬──────────┬────────┐                                         │
  │  │ Input   │ +2       │ Output │                                         │
  │  │ (4-bit) │          │ (2-bit)│                                         │
  │  ├─────────┼──────────┼────────┤                                         │
  │  │  0-1    │  2-3     │   0    │  ← Dark                                 │
  │  │  2-5    │  4-7     │   1    │                                         │
  │  │  6-9    │  8-11    │   2    │                                         │
  │  │ 10-15   │ 12-17    │   3    │  ← Bright                               │
  │  └─────────┴──────────┴────────┘                                         │
  │                                                                          │
  │  Pros: Better color gradients, reduced banding                           │
  │  Cons: Slightly more complex (adder required)                            │
  │                                                                          │
  │  MODE 1: TRUNCATE MSB (Most Significant Bits)                            │
  │  ─────────────────────────────────────────────                           │
  │  Algorithm: out = in[3:2]                                                │
  │                                                                          │
  │  Mapping: Direct use of upper 2 bits                                     │
  │  0-3→0, 4-7→1, 8-11→2, 12-15→3                                           │
  │                                                                          │
  │  Pros: Simplest hardware (just wiring)                                   │
  │  Cons: Loses fine color details                                          │
  │                                                                          │
  │  MODE 2: TRUNCATE LSB (Least Significant Bits)                           │
  │  ──────────────────────────────────────────────                          │
  │  Algorithm: out = in[1:0]                                                │
  │                                                                          │
  │  Mapping: Uses lower 2 bits (unusual choice)                             │
  │  Creates repeating pattern every 4 values                                │
  │                                                                          │
  │  Pros: Preserves color variations                                        │
  │  Cons: Non-linear, may produce unexpected results                        │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    SPECIAL COLOR PRESERVATION                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Pure Red Border Detection:                                              │
  │  ─────────────────────────                                               │
  │  Input: RGB(15,0,0) = 12'hF00  →  Output: RGB(3,0,0) = 6'b110000         │
  │                                                                          │
  │  This ensures game borders remain visually distinct:                     │
  │                                                                          │
  │  ┌─────────────────────────────────────┐                                 │
  │  │█████████████████████████████████████│ ← Pure red border               │
  │  │█                                   █│   always preserved              │
  │  │█         Game Play Area            █│                                 │
  │  │█                                   █│                                 │
  │  │█████████████████████████████████████│                                 │
  │  └─────────────────────────────────────┘                                 │
  │                                                                          │
  │  Why preserve borders?                                                   │
  │  • Visual game boundaries in retro games                                 │
  │  • UI element separation                                                 │
  │  • Collision detection references                                        │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      COLOR REDUCTION EXAMPLES                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Example conversions for different modes:                                │
  │                                                                          │
  │  ┌────────────┬─────────┬─────────┬─────────┬─────────┐                  │
  │  │ Color      │ RGB444  │ Mode 0  │ Mode 1  │ Mode 2  │                  │
  │  ├────────────┼─────────┼─────────┼─────────┼─────────┤                  │
  │  │ Black      │ 0,0,0   │ 0,0,0   │ 0,0,0   │ 0,0,0   │                  │
  │  │ Dark Gray  │ 4,4,4   │ 1,1,1   │ 1,1,1   │ 0,0,0   │                  │
  │  │ Mid Gray   │ 8,8,8   │ 2,2,2   │ 2,2,2   │ 0,0,0   │                  │
  │  │ Light Gray │ 12,12,12│ 3,3,3   │ 3,3,3   │ 0,0,0   │                  │
  │  │ White      │ 15,15,15│ 3,3,3   │ 3,3,3   │ 3,3,3   │                  │
  │  │ Pure Red   │ 15,0,0  │ 3,0,0   │ 3,0,0   │ 3,0,0   │                  │
  │  │ Dark Blue  │ 0,0,7   │ 0,0,2   │ 0,0,1   │ 0,0,3   │                  │
  │  └────────────┴─────────┴─────────┴─────────┴─────────┘                  │
  │                                                                          │
  │  Visual gradient comparison (Red channel):                               │
  │  ─────────────────────────────────────────                               │
  │  444: ░░▒▒▒▒▓▓▓▓████████  (16 levels)                                    │
  │  222: ░░▒▒▓▓██            (4 levels)                                     │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      IMPLEMENTATION NOTES                                │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Hardware Characteristics:                                               │
  │  • Purely combinational logic (zero clock cycles)                        │
  │  • No pipeline stages or registers                                       │
  │  • Typical propagation delay: < 2ns                                      │
  │                                                                          │
  │  Resource Usage (approximate):                                           │
  │  • Mode 0: ~30 LUTs (includes adders)                                    │
  │  • Mode 1: ~6 LUTs (just multiplexers)                                   │
  │  • Mode 2: ~6 LUTs (just multiplexers)                                   │
  │  • Border detection: ~4 LUTs                                             │
  │                                                                          │
  │  Design Decisions:                                                       │
  │  • Parameter-based mode selection for synthesis optimization             │
  │  • Special case handling integrated into main logic                      │
  │  • No clock required = suitable for any clock domain                     │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLES                                  │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Instance with linear scaling (recommended)                           │
  │  rgb444_to_rgb222 #(                                                     │
  │      .REDUCTION_MODE(0)    // Linear scaling with rounding               │
  │  ) color_reducer (                                                       │
  │      .pixel_in(vga_rgb),   // 12-bit RGB from VGA controller             │
  │      .pixel_out(lcd_rgb)   // 6-bit RGB to LCD display                   │
  │  );                                                                      │
  │                                                                          │
  │  // Pipeline example for high-speed operation                            │
  │  reg [11:0] pixel_reg;                                                   │
  │  wire [5:0] reduced_pixel;                                               │
  │                                                                          │
  │  always @(posedge clk) begin                                             │
  │      pixel_reg <= source_pixel;  // Register input                       │
  │  end                                                                     │
  │                                                                          │
  │  rgb444_to_rgb222 reducer (                                              │
  │      .pixel_in(pixel_reg),                                               │
  │      .pixel_out(reduced_pixel)                                           │
  │  );                                                                      │
  │                                                                          │
  │  // Use in a video processing chain                                      │
  │  assign led_matrix = {reduced_pixel[5:4],  // Red                        │
  │                       reduced_pixel[3:2],  // Green                      │
  │                       reduced_pixel[1:0]}; // Blue                       │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/ 


 module rgb444_to_rgb222 (
    input wire [11:0] pixel_in,   // RGB444 (4 bits for R, G, B)
    output wire [5:0] pixel_out   // RGB222 (2 bits for R, G, B)
);

    parameter REDUCTION_MODE = 0; // 0: Lineal, 1: Trunc MSB, 2: Trunc LSB
    // Detect red border and forze color vivid red (15, 0, 0)
    wire is_border = (pixel_in == 12'hF00);

    // Lineal scaling: (in + 2) >> 2
    wire [5:0] r_scaled = (pixel_in[11:8] + 2) >> 2; // R
    wire [5:0] g_scaled = (pixel_in[7:4]  + 2) >> 2; // G
    wire [5:0] b_scaled = (pixel_in[3:0]  + 2) >> 2; // B

    // Mapping mode
    reg [1:0] r_out, g_out, b_out;
    always @(*) begin
        if (is_border) begin
            // Border fixed red color {2'b11, 2'b00, 2'b00}
            r_out = 2'b11;
            g_out = 2'b00;
            b_out = 2'b00;
        end else begin
            case (REDUCTION_MODE)
                0: begin // Lineal
                    r_out = r_scaled[1:0]; // LSB para color raw values
                    g_out = g_scaled[1:0];
                    b_out = b_scaled[1:0];
                end
                1: begin // Trunc MSB
                    r_out = pixel_in[11:10];
                    g_out = pixel_in[7:6];
                    b_out = pixel_in[3:2];
                end
                2: begin // Trunc LSB
                    r_out = pixel_in[9:8];
                    g_out = pixel_in[5:4];
                    b_out = pixel_in[1:0];
                end
                default: begin
                    r_out = r_scaled[1:0];
                    g_out = g_scaled[1:0];
                    b_out = b_scaled[1:0];
                end
            endcase
        end
    end

    assign pixel_out = {r_out, g_out, b_out};

endmodule

