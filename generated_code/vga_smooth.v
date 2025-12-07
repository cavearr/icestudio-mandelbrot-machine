/***| vga_smooth.v |

  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com

  This work is dedicated to the public domain under the Creative Commons
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s)
  have waived all copyright and related or neighboring rights to this work
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/

  -- Citing authorship is a personal ethical decision --

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                   VGA REAL-TIME SMOOTHING FILTER                         │
  │                                                                          │
  │  3×3 convolution filter with bypass window for preserving                │
  │  sharp some elements while smoothing backgrounds                         │
  └──────────────────────────────────────────────────────────────────────────┘

  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module implements a real-time 3×3 box filter for VGA signals       ║
  ║  with selective bypass capability:                                       ║
  ║                                                                          ║
  ║  • Smooths entire screen using 3×3 pixel averaging                       ║
  ║  • Bypass window preserves original pixels (for some sprites as example) ║
  ║  • Red border highlights the bypass region                               ║
  ║  • Dual line buffer architecture for real-time processing                ║
  ║  • Pipelined design for 25.175 MHz operation                             ║
  ║  • Perfect for retro gaming with CRT-like smoothing                      ║
  ║                                                                          ║
  ║  OPTIMIZED VERSION: Reduced LC usage for ice40 FPGAs                     ║
  ║  • Power-of-2 buffer addressing (no adders)                              ║
  ║  • Pipelined sum calculation                                             ║
  ║  • Sync passthrough (no comparators)                                     ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                       3×3 BOX FILTER ALGORITHM                           │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Convolution kernel (equal weights):                                     │
  │  ──────────────────────────────────                                      │
  │                                                                          │
  │           ┌─────┬─────┬─────┐                                            │
  │           │ 1/9 │ 1/9 │ 1/9 │                                            │
  │           ├─────┼─────┼─────┤                                            │
  │           │ 1/9 │ 1/9 │ 1/9 │                                            │
  │           ├─────┼─────┼─────┤                                            │
  │           │ 1/9 │ 1/9 │ 1/9 │                                            │
  │           └─────┴─────┴─────┘                                            │
  │                                                                          │
  │  Pixel naming convention:          Implementation:                       │
  │  ───────────────────────          ───────────────                        │
  │                                                                          │
  │    p1  p2  p3     (previous)      out = (p1 + p2 + p3 +                  │
  │    p4  p5  p6  ←  (current)             p4 + p5 + p6 +                   │
  │    p7  p8  p9     (next)                 p7 + p8 + p9) / 9               │
  │         ↑                                                                │
  │    center pixel                    Division by shift: sum >> 3           │
  │                                    (approximates /9 as /8)               │
  │                                                                          │
  │  Visual effect:                                                          │
  │  • Reduces pixelation and jagged edges                                   │
  │  • Creates subtle blur similar to CRT displays                           │
  │  • Preserves overall brightness and color                                │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    LINE BUFFER ARCHITECTURE                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Double-buffering strategy for 3-line access:                            │
  │                                                                          │
  │  Memory Organization (optimized with power-of-2 addressing):             │
  │  ─────────────────────────────────────────────────────────               │
  │  ┌─────────────────────────────────────┐                                 │
  │  │  Buffer A (1024 pixels) │ Buffer B  │  Total: 2048 pixels             │
  │  └─────────────────────────────────────┘                                 │
  │   Addresses 0-1023          Addresses 1024-2047                          │
  │   Address = {vc[0], hc[9:0]} - no adder needed!                          │
  │                                                                          │
  │  Line alternation (based on vc[0]):                                      │
  │  ─────────────────────────────────                                       │
  │  Even lines: Write to A, Read from B                                     │
  │  Odd lines:  Write to B, Read from A                                     │
  │                                                                          │
  │  Data flow timing:                                                       │
  │  ────────────────                                                        │
  │  Line n-2: [In buffer, being read]                                       │
  │  Line n-1: [In shift registers p1-p3, p4-p6]                             │
  │  Line n:   [Current input p7-p9]                                         │
  │                                                                          │
  │  This provides access to 3 consecutive lines simultaneously              │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      BYPASS WINDOW FEATURE                               │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Preserves original pixels in a rectangular region:                      │
  │                                                                          │
  │  Screen Layout:                                                          │
  │  ─────────────                                                           │
  │  ┌───────────────────────────────────────┐                               │
  │  │ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │ ← Smoothed background          │
  │  │ ░░░░░┌─────────────────┐░░░░░░░░░░░░ │                                │
  │  │ ░░░░░│█████████████████│░░░░░░░░░░░░ │ ← Red border (1px)             │
  │  │ ░░░░░│█               █│░░░░░░░░░░░░ │                                │
  │  │ ░░░░░│█    Sprite     █│░░░░░░░░░░░░ │ ← Original pixels              │
  │  │ ░░░░░│█   (sharp)     █│░░░░░░░░░░░░ │   preserved                    │
  │  │ ░░░░░│█               █│░░░░░░░░░░░░ │                                │
  │  │ ░░░░░│█████████████████│░░░░░░░░░░░░ │                                │
  │  │ ░░░░░└─────────────────┘░░░░░░░░░░░░ │                                │
  │  │ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │                                │
  │  └───────────────────────────────────────┘                               │
  │        (bx,by)     BWIDTH×BHEIGHT                                        │
  │                                                                          │
  │  Use cases:                                                              │
  │  • Keep game character sharp while smoothing background                  │
  │  • Preserve UI elements like score/health bars                           │
  │  • Highlight active game area                                            │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      PIPELINE ARCHITECTURE                               │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  4-stage pipeline for 25.175 MHz operation (optimized):                  │
  │                                                                          │
  │  Clock:  ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐                                         │
  │         ─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─                                        │
  │                                                                          │
  │  Stage 0: Buffer Management                                              │
  │  ───────────────────────────                                             │
  │  • Read from line buffer → p1                                            │
  │  • Shift registers: p1→p4→p7, etc.                                       │
  │  • Write current pixel to buffer                                         │
  │                                                                          │
  │  Stage 1: Partial Sums (3 groups of 3)                                   │
  │  ──────────────────────────────────────                                  │
  │  • sum_a = p1 + p2 + p3                                                  │
  │  • sum_b = p4 + p5 + p6                                                  │
  │  • sum_c = p7 + p8 + p9                                                  │
  │                                                                          │
  │  Stage 2: Final Sum                                                      │
  │  ──────────────────                                                      │
  │  • r_sum = sum_a_r + sum_b_r + sum_c_r                                   │
  │  • (same for g, b)                                                       │
  │                                                                          │
  │  Stage 3: Output Generation                                              │
  │  ─────────────────────────                                               │
  │  • Divide sums by 8 (shift right 3)                                      │
  │  • Select between smoothed/bypass/border                                 │
  │  • Register final output                                                 │
  │                                                                          │
  │  Total latency: 4 clock cycles                                           │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    VGA TIMING COMPATIBILITY                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Standard VGA 640×480 @ 60Hz timing:                                     │
  │                                                                          │
  │  Horizontal: 800 total pixels                                            │
  │  ┌──────┬────┬──────┬────┐                                               │
  │  │Active│ FP │Sync  │ BP │                                               │
  │  │ 640  │ 16 │ 96   │ 48 │                                               │
  │  └──────┴────┴──────┴────┘                                               │
  │                                                                          │
  │  Vertical: 525 total lines                                               │
  │  ┌──────┬────┬────┬────┐                                                 │
  │  │Active│ FP │Sync│ BP │                                                 │
  │  │ 480  │ 10 │ 2  │ 33 │                                                 │
  │  └──────┴────┴────┴────┘                                                 │
  │                                                                          │
  │  Module maintains exact timing while processing pixels                   │
  │  Sync signals are passed through with matched pipeline delay             │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLE                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Instantiate smoothing filter with 2-bit RGB                          │
  │  vga_smooth #(                                                           │
  │      .BITS_PER_PIXEL(2),   // 2 bits per color = 64 colors               │
  │      .BWIDTH(100),         // Bypass window width                        │
  │      .BHEIGHT(100)         // Bypass window height                       │
  │  ) smoother (                                                            │
  │      .clk(vga_clk),        // 25.175 MHz VGA clock                       │
  │      .pixel_in(raw_rgb),   // 6-bit RGB input                            │
  │      .hc(h_counter),       // Horizontal counter 0-799                   │
  │      .vc(v_counter),       // Vertical counter 0-524                     │
  │      .hsync_in(h_sync),    // Input horizontal sync                      │
  │      .vsync_in(v_sync),    // Input vertical sync                        │
  │      .bypass(game_active), // 1 = show bypass window                     │
  │      .bx(sprite_x),        // Sprite X position                          │
  │      .by(sprite_y),        // Sprite Y position                          │
  │      .pixel_out(smooth_rgb), // Smoothed output                          │
  │      .hsync_out(h_sync_out), // Output horizontal sync                   │
  │      .vsync_out(v_sync_out)  // Output vertical sync                     │
  │  );                                                                      │
  │                                                                          │
  │  // Connect to VGA DAC                                                   │
  │  assign vga_r = smooth_rgb[5:4];  // Red channel                         │
  │  assign vga_g = smooth_rgb[3:2];  // Green channel                       │
  │  assign vga_b = smooth_rgb[1:0];  // Blue channel                        │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  *+*/

module vga_smooth #(
    parameter BITS_PER_PIXEL = 2,  // Bits per channel (R, G, B)
    parameter BWIDTH = 100,        // Bypass window width
    parameter BHEIGHT = 100        // Bypass window height
) (
    input wire clk,                        // VGA Clock (25.175 MHz)
    input wire [3*BITS_PER_PIXEL-1:0] pixel_in, // Input pixel RGB
    input wire [9:0] hc,                   // Video horizontal counter (0 to 799)
    input wire [9:0] vc,                   // Video vertical counter (0 to 524)
    input wire hsync_in,                   // Horizontal sync signal
    input wire vsync_in,                   // Vertical sync signal
    input wire bypass,                     // Bypass mode (0: normal, 1: bypass)
    input wire [9:0] bx,                   // Bypass window x coordinate
    input wire [9:0] by,                   // Bypass window y coordinate
    output reg [3*BITS_PER_PIXEL-1:0] pixel_out, // Smooth pixel RGB
    output reg hsync_out,                  // Translated horizontal sync
    output reg vsync_out                   // Translated vertical sync
);

    // ──────────────────────────────────────────────────────────────────────
    // Constants
    // ──────────────────────────────────────────────────────────────────────
    localparam H_ACTIVE = 640;
    localparam V_ACTIVE = 480;
    localparam PIXEL_WIDTH = 3 * BITS_PER_PIXEL;
    localparam SUM_WIDTH = BITS_PER_PIXEL + 4;
    localparam PARTIAL_SUM_WIDTH = BITS_PER_PIXEL + 2; // For 3-value partial sums

    // ──────────────────────────────────────────────────────────────────────
    // Active region detection
    // ──────────────────────────────────────────────────────────────────────
    wire active = (hc < H_ACTIVE) && (vc < V_ACTIVE);

    // ──────────────────────────────────────────────────────────────────────
    // Bypass window detection (optimized: precalculate limits)
    // ──────────────────────────────────────────────────────────────────────
    wire [9:0] bx_end = bx + BWIDTH - 1;
    wire [9:0] by_end = by + BHEIGHT - 1;
    wire in_window = (hc >= bx) & (hc <= bx_end) & (vc >= by) & (vc <= by_end);
    wire on_border = in_window & ((hc == bx) | (hc == bx_end) | (vc == by) | (vc == by_end));

    // ──────────────────────────────────────────────────────────────────────
    // Pipeline delay for window/border detection (4 stages total)
    // ──────────────────────────────────────────────────────────────────────
    reg in_window_d1, in_window_d2, in_window_d3;
    reg on_border_d1, on_border_d2, on_border_d3;

    always @(posedge clk) begin
        in_window_d1 <= in_window;
        in_window_d2 <= in_window_d1;
        in_window_d3 <= in_window_d2;
        on_border_d1 <= on_border;
        on_border_d2 <= on_border_d1;
        on_border_d3 <= on_border_d2;
    end

    // ──────────────────────────────────────────────────────────────────────
    // Sync signal passthrough with pipeline delay (saves comparator LCs)
    // ──────────────────────────────────────────────────────────────────────
    reg hsync_d1, hsync_d2, hsync_d3, hsync_d4;
    reg vsync_d1, vsync_d2, vsync_d3, vsync_d4;

    always @(posedge clk) begin
        hsync_d1 <= hsync_in;
        hsync_d2 <= hsync_d1;
        hsync_d3 <= hsync_d2;
        hsync_d4 <= hsync_d3;
        vsync_d1 <= vsync_in;
        vsync_d2 <= vsync_d1;
        vsync_d3 <= vsync_d2;
        vsync_d4 <= vsync_d3;
    end

    // ──────────────────────────────────────────────────────────────────────
    // Line buffer with power-of-2 addressing (saves adder LCs)
    // Buffer size: 2 × 1024 = 2048 pixels (uses BRAM)
    // ──────────────────────────────────────────────────────────────────────
    reg [PIXEL_WIDTH-1:0] line_buf [0:2047];

    // Addresses without adders: {vc[0], hc[9:0]}
    wire [10:0] write_addr = {vc[0], hc[9:0]};
    wire [10:0] read_addr = {~vc[0], hc[9:0]};

    // ──────────────────────────────────────────────────────────────────────
    // 3×3 pixel registers
    // ──────────────────────────────────────────────────────────────────────
    reg [PIXEL_WIDTH-1:0] p1, p2, p3; // Previous line
    reg [PIXEL_WIDTH-1:0] p4, p5, p6; // Current line
    reg [PIXEL_WIDTH-1:0] p7, p8, p9; // Next line

    // Delayed pixel for bypass mode
    reg [PIXEL_WIDTH-1:0] pixel_d1, pixel_d2, pixel_d3;

    // ──────────────────────────────────────────────────────────────────────
    // Stage 0: Buffer read/write and shift registers
    // ──────────────────────────────────────────────────────────────────────
    always @(posedge clk) begin
        if (active) begin
            // Read from buffer and shift
            p1 <= line_buf[read_addr];
            p4 <= p1;
            p7 <= pixel_in;

            // Write to buffer
            line_buf[write_addr] <= pixel_in;

            // Horizontal shift
            p3 <= p2; p2 <= p1;
            p6 <= p5; p5 <= p4;
            p9 <= p8; p8 <= p7;

            // Delay pixel for bypass
            pixel_d1 <= pixel_in;
        end

        // Continue delay outside active (for proper timing)
        pixel_d2 <= pixel_d1;
        pixel_d3 <= pixel_d2;
    end

    // ──────────────────────────────────────────────────────────────────────
    // Stage 1: Partial sums (3 groups of 3 pixels each)
    // Reduces critical path by splitting 9-input sum into 3+3+3
    // ──────────────────────────────────────────────────────────────────────
    reg [PARTIAL_SUM_WIDTH-1:0] r_sum_a, r_sum_b, r_sum_c;
    reg [PARTIAL_SUM_WIDTH-1:0] g_sum_a, g_sum_b, g_sum_c;
    reg [PARTIAL_SUM_WIDTH-1:0] b_sum_a, b_sum_b, b_sum_c;

    always @(posedge clk) begin
        // Red channel partial sums
        r_sum_a <= p1[3*BITS_PER_PIXEL-1:2*BITS_PER_PIXEL] +
                   p2[3*BITS_PER_PIXEL-1:2*BITS_PER_PIXEL] +
                   p3[3*BITS_PER_PIXEL-1:2*BITS_PER_PIXEL];
        r_sum_b <= p4[3*BITS_PER_PIXEL-1:2*BITS_PER_PIXEL] +
                   p5[3*BITS_PER_PIXEL-1:2*BITS_PER_PIXEL] +
                   p6[3*BITS_PER_PIXEL-1:2*BITS_PER_PIXEL];
        r_sum_c <= p7[3*BITS_PER_PIXEL-1:2*BITS_PER_PIXEL] +
                   p8[3*BITS_PER_PIXEL-1:2*BITS_PER_PIXEL] +
                   p9[3*BITS_PER_PIXEL-1:2*BITS_PER_PIXEL];

        // Green channel partial sums
        g_sum_a <= p1[2*BITS_PER_PIXEL-1:BITS_PER_PIXEL] +
                   p2[2*BITS_PER_PIXEL-1:BITS_PER_PIXEL] +
                   p3[2*BITS_PER_PIXEL-1:BITS_PER_PIXEL];
        g_sum_b <= p4[2*BITS_PER_PIXEL-1:BITS_PER_PIXEL] +
                   p5[2*BITS_PER_PIXEL-1:BITS_PER_PIXEL] +
                   p6[2*BITS_PER_PIXEL-1:BITS_PER_PIXEL];
        g_sum_c <= p7[2*BITS_PER_PIXEL-1:BITS_PER_PIXEL] +
                   p8[2*BITS_PER_PIXEL-1:BITS_PER_PIXEL] +
                   p9[2*BITS_PER_PIXEL-1:BITS_PER_PIXEL];

        // Blue channel partial sums
        b_sum_a <= p1[BITS_PER_PIXEL-1:0] +
                   p2[BITS_PER_PIXEL-1:0] +
                   p3[BITS_PER_PIXEL-1:0];
        b_sum_b <= p4[BITS_PER_PIXEL-1:0] +
                   p5[BITS_PER_PIXEL-1:0] +
                   p6[BITS_PER_PIXEL-1:0];
        b_sum_c <= p7[BITS_PER_PIXEL-1:0] +
                   p8[BITS_PER_PIXEL-1:0] +
                   p9[BITS_PER_PIXEL-1:0];
    end

    // ──────────────────────────────────────────────────────────────────────
    // Stage 2: Final sums (combine 3 partial sums)
    // ──────────────────────────────────────────────────────────────────────
    reg [SUM_WIDTH-1:0] r_sum, g_sum, b_sum;

    always @(posedge clk) begin
        r_sum <= r_sum_a + r_sum_b + r_sum_c;
        g_sum <= g_sum_a + g_sum_b + g_sum_c;
        b_sum <= b_sum_a + b_sum_b + b_sum_c;
    end

    // ──────────────────────────────────────────────────────────────────────
    // Stage 3: Output selection and sync
    // ──────────────────────────────────────────────────────────────────────
    reg [PIXEL_WIDTH-1:0] pixel_out_reg;

    always @(posedge clk) begin
        // Sync passthrough with matched delay
        hsync_out <= hsync_d4;
        vsync_out <= vsync_d4;

        // Pixel output selection
        if (bypass & on_border_d3) begin
            // Red border
            pixel_out_reg <= {{BITS_PER_PIXEL{1'b1}}, {2*BITS_PER_PIXEL{1'b0}}};
        end else if (bypass & in_window_d3) begin
            // Original pixel (bypass smoothing)
            pixel_out_reg <= pixel_d3;
        end else begin
            // Smoothed pixel (sum >> 3 = divide by 8)
            pixel_out_reg <= {r_sum[BITS_PER_PIXEL+2:3],
                              g_sum[BITS_PER_PIXEL+2:3],
                              b_sum[BITS_PER_PIXEL+2:3]};
        end

        pixel_out <= pixel_out_reg;
    end

endmodule
