/***| window_checker.v |
  
  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com
 
  This work is dedicated to the public domain under the Creative Commons 
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s) 
  have waived all copyright and related or neighboring rights to this work 
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/
 
  -- Citing authorship is a personal ethical decision -- 

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                  VIDEO WINDOW BOUNDARY CHECKER                           │
  │                                                                          │
  │  Maps screen coordinates to window-relative addresses for                │
  │  selective video buffer access and windowed rendering like a simple      │
  │  clipping area detection.                                                │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module performs boundary checking and address translation for      ║
  ║  windowed video operations:                                              ║
  ║                                                                          ║
  ║  • Determines if a pixel coordinate falls within a defined window        ║
  ║  • Translates absolute screen addresses to window-relative addresses     ║
  ║  • Optimized for 4-pixel packed memory organization                      ║
  ║  • Zero-latency combinational logic                                      ║
  ║  • Supports arbitrary window positioning on screen                       ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      ADDRESS FORMAT DECODING                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Input address encodes VGA coordinates in 16 bits:                       │
  │                                                                          │
  │  a[15:0] format:                                                         │
  │  ┌─────────────────┬──────────────────┐                                  │
  │  │  a[15:7] (9b)   │   a[6:0] (7b)    │                                  │
  │  └─────────────────┴──────────────────┘                                  │
  │       vc (y)           hc[8:2]                                           │
  │                      (x divided by 4)                                    │
  │                                                                          │
  │  Decoding process:                                                       │
  │  ────────────────                                                        │
  │  1. Extract y coordinate: vc = a[15:7]                                   │
  │  2. Extract x/4: hc_div_4 = a[6:0]                                       │
  │  3. Reconstruct x: x = hc_div_4 << 2                                     │
  │                                                                          │
  │  Example:                                                                │
  │  ────────                                                                │
  │  a = 0x0A14 = 0000101000010100                                           │
  │                └──┘└──┘└──────┘                                          │
  │                 20  y=80  x/4=20                                         │
  │  Decoded: x = 80, y = 20                                                 │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      WINDOW BOUNDARY CHECKING                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Window definition and boundary test:                                    │
  │                                                                          │
  │  Screen coordinate space:                                                │
  │  ───────────────────────                                                 │
  │  (0,0) ┌─────────────────────────────┐                                   │
  │        │                             │                                   │
  │        │    (sx,sy) ┌───────────┐    │                                   │
  │        │            │░░░░░░░░░░░│    │                                   │
  │        │            │░ Window  ░│    │                                   │
  │        │            │░ winW×   ░│    │                                   │
  │        │            │░ winH    ░│    │                                   │
  │        │            │░░░░░░░░░░░│    │                                   │
  │        │            └───────────┘    │                                   │
  │        │              (x_end,y_end)  │                                   │
  │        └─────────────────────────────┘                                   │
  │                                   (639,479)                              │
  │                                                                          │
  │  Boundary conditions:                                                    │
  │  ──────────────────                                                      │
  │  in_window = (x >= sx) AND (x < sx + winW) AND                           │
  │              (y >= sy) AND (y < sy + winH)                               │
  │                                                                          │
  │  Example for 128×64 window at (100,50):                                  │
  │  • sx = 100, sy = 50                                                     │
  │  • x_end = 228, y_end = 114                                              │
  │  • Point (150,80) → in_window = 1                                        │
  │  • Point (250,80) → in_window = 0                                        │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                   WINDOW-RELATIVE ADDRESS CALCULATION                    │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Translation from screen coordinates to window buffer address:           │
  │                                                                          │
  │  Step 1: Calculate relative coordinates                                  │
  │  ─────────────────────────────────────                                   │
  │  rel_x = x - sx     (horizontal offset within window)                    │
  │  rel_y = y - sy     (vertical offset within window)                      │
  │                                                                          │
  │  Step 2: Convert to linear address                                       │
  │  ────────────────────────────────                                        │
  │  Since 4 pixels are packed per word:                                     │
  │  rel_x_div_4 = rel_x >> 2                                                │
  │  win_addr = rel_y × (winW/4) + rel_x_div_4                               │
  │                                                                          │
  │  Memory layout visualization (128×64 window):                            │
  │  ───────────────────────────────────────────                             │
  │                                                                          │
  │  Row 0: [0][1][2]...[31]     32 words (128 pixels)                       │
  │  Row 1: [32][33][34]...[63]                                              │
  │  Row 2: [64][65][66]...[95]                                              │
  │  ...                                                                     │
  │  Row 63: [2016][2017]...[2047]                                           │
  │                                                                          │
  │  Total: 64 rows × 32 words/row = 2048 words                              │
  │                                                                          │
  │  Example calculation:                                                    │
  │  ───────────────────                                                     │
  │  Screen pixel (150,80), window at (100,50):                              │
  │  • rel_x = 150 - 100 = 50                                                │
  │  • rel_y = 80 - 50 = 30                                                  │
  │  • rel_x_div_4 = 50 >> 2 = 12                                            │
  │  • win_addr = 30 × 32 + 12 = 972                                         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      PIXEL PACKING ALIGNMENT                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Memory organization with 4 pixels per 16-bit word:                      │
  │                                                                          │
  │  Screen pixels and memory mapping:                                       │
  │  ────────────────────────────────                                        │
  │                                                                          │
  │  X coordinates:  0   1   2   3   4   5   6   7   ...                     │
  │  Memory words:   └───word 0───┘ └───word 1───┘                           │
  │                                                                          │
  │  Window constraint:                                                      │
  │  • sx must be multiple of 4 for proper alignment                         │
  │  • winW must be multiple of 4 for complete words                         │
  │                                                                          │
  │  Address calculation optimizations:                                      │
  │  • Division by 4 → shift right 2 bits                                    │
  │  • Multiplication by row width → shift and add                           │
  │  • All operations are single-cycle combinational                         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      PARAMETERIZATION                                    │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Default configuration:                                                  │
  │  • winW = 128 pixels (32 words)                                          │
  │  • winH = 64 pixels                                                      │
  │  • Buffer size = 2048 words (8KB)                                        │
  │  • Address width = 11 bits                                               │
  │                                                                          │
  │  Common window sizes and memory requirements:                            │
  │  ┌──────────┬────────┬──────────┬────────────┐                           │
  │  │ Window   │ Words  │ Address  │ Memory     │                           │
  │  │ Size     │ Total  │ Bits     │ (bytes)    │                           │
  │  ├──────────┼────────┼──────────┼────────────┤                           │
  │  │ 64×32    │ 512    │ 9        │ 1KB        │                           │
  │  │ 128×64   │ 2048   │ 11       │ 4KB        │                           │
  │  │ 256×128  │ 8192   │ 13       │ 16KB       │                           │
  │  │ 320×240  │ 19200  │ 15       │ 38KB       │                           │
  │  └──────────┴────────┴──────────┴────────────┘                           │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLE                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Instance for checking 128×64 window                                  │
  │  window_checker #(                                                       │
  │      .winW(128),           // Window width in pixels                     │
  │      .winH(64)             // Window height in pixels                    │
  │  ) win_check (                                                           │
  │      .a(vram_addr),        // VGA address {vc[8:0], hc[8:2]}             │
  │      .sx(window_x),        // Window X position (multiple of 4)          │
  │      .sy(window_y),        // Window Y position                          │
  │      .in_window(inside),   // 1 if pixel is in window                    │
  │      .win_addr(local_addr) // Address within window buffer               │
  │  );                                                                      │
  │                                                                          │
  │  // Use in memory controller                                             │
  │  always @(posedge clk) begin                                             │
  │      if (write_enable && inside) begin                                   │
  │          window_buffer[local_addr] <= pixel_data;                        │
  │      end                                                                 │
  │  end                                                                     │
  │                                                                          │
  │  // Typical usage: sprite/tile rendering                                 │
  │  assign sprite_visible = inside && (sprite_id == active_sprite);         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/ 

module window_checker (
    input wire [15:0] a,         // Main buffer address: {vc[8:0], hc[8:2]}
    input wire [9:0] sx,         // X window clip position (x4)                  
    input wire [8:0] sy,         // Y window clip position       
    output wire in_window,       // 1 if pixel is inside the clipping, 0 if is outside the clipping area      
    output wire [ADDR_WIDTH-1:0] win_addr  // Current pixel address in clipping buffer
);
    parameter winW = 128;
    parameter winH = 64;
    localparam  ADDR_WIDTH = $clog2((winW* winH) >> 2);                       

    localparam WIN_WORDS_PER_ROW = winW / 4; // 32  words per file for the clipping area

    // Extract vc (y) y hc[8:2] (x/4) from address "a" 
    wire [8:0] vc = a[15:7];              // y pos
    wire [6:0] hc_div_4 = a[6:0];         // hc[8:2], that is  x/4
    wire [8:0] x = {hc_div_4, 2'b00};     // x = hc[8:2] * 4 ( the same as shift 2 bits)

    // Clipping area
    wire [9:0] x_end = sx + winW;         // Right limit: sx + 128
    wire [8:0] y_end = sy + winH;         // Bottom limit: sy + 64

    // Is the pixel inside the clipping area?
    assign in_window = (x >= sx) && (x < x_end) && (vc >= sy) && (vc < y_end);

    // TRanslate to clipping area buffer addressing 
    wire [8:0] rel_x = x - sx;            // Relative x pos
    wire [8:0] rel_y = vc - sy;           // Relative y pos 
    wire [6:0] rel_x_div_4 = rel_x[8:2];  // (x - sx)/4
    assign win_addr = in_window ? (rel_y * WIN_WORDS_PER_ROW + rel_x_div_4) : 11'b0;

endmodule

