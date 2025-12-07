/***| resize_mapper.v |
 
  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com
 
  This work is dedicated to the public domain under the Creative Commons 
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s) 
  have waived all copyright and related or neighboring rights to this work 
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/
 
  -- Citing authorship is a personal ethical decision -- 
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      VIDEO BUFFER RESIZE MAPPER                          │
  │                                                                          │
  │  Maps addresses from a full-resolution buffer to a reduced-resolution    │
  │  buffer for efficient video downsampling and memory usage                │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module performs real-time address translation for video buffer     ║
  ║  downsampling, enabling:                                                 ║
  ║                                                                          ║
  ║  • Automatic resolution reduction (e.g., 512×480 → 64×60)                ║
  ║  • Memory-efficient storage of downsampled video                         ║
  ║  • Selective row/column sampling to maintain aspect ratio                ║
  ║  • Direct mapping from display coordinates to buffer addresses           ║
  ║                                                                          ║
  ║  Primary use case: Creating thumbnail views or reduced-resolution        ║
  ║  copies of video frames for preview or processing                        ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      ADDRESS MAPPING CONCEPT                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Original Buffer (512×480):        Reduced Buffer (64×60):               │
  │  ─────────────────────────         ───────────────────────               │
  │                                                                          │
  │  ┌─────────────────────┐          ┌─────────┐                            │
  │  │ ■ □ □ □ □ □ □ □ ... │ 8×8      │ ■ ...   │                            │
  │  │ □ □ □ □ □ □ □ □ ... │ block    │ ...     │                            │
  │  │ □ □ □ □ □ □ □ □ ... │ ────→    │ ...     │ Each pixel                 │
  │  │ □ □ □ □ □ □ □ □ ... │          └─────────┘ represents                 │
  │  │ □ □ □ □ □ □ □ □ ... │                      8×8 block                  │
  │  │ □ □ □ □ □ □ □ □ ... │                                                 │
  │  │ □ □ □ □ □ □ □ □ ... │          ■ = Sampled pixel                      │
  │  │ □ □ □ □ □ □ □ □ ... │          □ = Skipped pixel                      │
  │  └─────────────────────┘                                                 │
  │                                                                          │
  │  Sampling pattern: Take top-left pixel of each 8×8 block                 │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    ADDRESS FORMAT AND DECODING                           │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Input address format (16 bits):                                         │
  │  ┌────────────────┬──────────────┐                                       │
  │  │ a[15:7] (9b)   │ a[6:0] (7b)  │                                       │
  │  └────────────────┴──────────────┘                                       │
  │       vc (y)         hc[8:2]                                             │
  │                                                                          │
  │  Decoding process:                                                       │
  │  ─────────────────                                                       │
  │  1. Extract coordinates:                                                 │
  │     • vc = a[15:7] = y coordinate (0-479)                                │
  │     • hc = {a[6:0], 2'b00} = x coordinate (0-508, step 4)                │
  │                                                                          │
  │  2. Calculate reduced coordinates:                                       │
  │     • x_reduced = hc >> 3 = hc / 8    (for 8:1 scaling)                  │
  │     • y_reduced = vc >> 3 = vc / 8    (for 8:1 scaling)                  │
  │                                                                          │
  │  3. Generate reduced address:                                            │
  │     • reduced_addr = y_reduced * REDUCED_W + x_reduced                   │
  │     • Simplified: reduced_addr = {y_reduced, x_reduced}                  │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      SELECTIVE ROW SAMPLING                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  For write operations, only sample specific rows to reduce bandwidth:    │
  │                                                                          │
  │  Original rows:  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 ...      │
  │                  ↓  ×  ×  ×  ×  ×  ×  ×  ↓  ×  ×  ×  ×  ×  ×  × ...      │
  │  Sampled rows:   0                       8                      ...      │
  │                                                                          │
  │  Rule: Sample when (y % Y_SCALE) == 0                                    │
  │                                                                          │
  │  Implementation:                                                         │
  │  ───────────────                                                         │
  │  • in_window = (we_n == 0) ? (vc[2:0] == 0) : 1                          │
  │  • Write enabled only for rows 0, 8, 16, 24, ...                         │
  │  • All rows valid for read operations                                    │
  │                                                                          │
  │  Benefits:                                                               │
  │  • Reduces write bandwidth by factor of Y_SCALE                          │
  │  • Maintains consistent sampling pattern                                 │
  │  • Simplifies hardware (just check low bits)                             │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      PARAMETERIZATION EXAMPLES                           │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Example 1: VGA to Thumbnail (8:1 reduction)                             │
  │  ───────────────────────────────────────────                             │
  │  Original: 640×480 → Reduced: 80×60                                      │
  │  Memory saved: 87.5% (307KB → 4.8KB)                                     │
  │                                                                          │
  │  Example 2: HD to Preview (16:1 reduction)                               │
  │  ─────────────────────────────────────────                               │
  │  Original: 1280×720 → Reduced: 80×45                                     │
  │  Memory saved: 93.75% (921KB → 3.6KB)                                    │
  │                                                                          │
  │  Example 3: Custom aspect preservation                                   │
  │  ────────────────────────────────────                                    │
  │  Original: 512×480 → Reduced: 64×60                                      │
  │  X_SCALE = 8, Y_SCALE = 8 (maintains 16:15 aspect)                       │
  │                                                                          │
  │  Constraints:                                                            │
  │  • ORIG_W must be divisible by REDUCED_W                                 │
  │  • ORIG_H must be divisible by REDUCED_H                                 │
  │  • Scale factors must be powers of 2 for optimal synthesis               │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                        TIMING CHARACTERISTICS                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  All operations are combinational (zero clock cycles):                   │
  │                                                                          │
  │  Input signals ──→ [Combinational Logic] ──→ Output signals              │
  │                          0 ns delay*                                     │
  │                    (*plus routing delays)                                │
  │                                                                          │
  │  Critical path: Address decode → Shift → Concatenate                     │
  │  Typical delay: < 5 ns on modern FPGAs                                   │
  │                                                                          │
  │  No registers means:                                                     │
  │  • Instant address translation                                           │
  │  • No pipeline latency                                                   │
  │  • Suitable for real-time video processing                               │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLE                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Instantiate mapper for 8:1 video reduction                           │
  │  resize_mapper #(                                                        │
  │      .ORIG_W(512),         // Original width                             │
  │      .ORIG_H(480),         // Original height                            │
  │      .REDUCED_W(64),       // Reduced width (512/8)                      │
  │      .REDUCED_H(60)        // Reduced height (480/8)                     │
  │  ) video_mapper (                                                        │
  │      .a(vram_addr),        // Address from video controller              │
  │      .we_n(vram_we_n),     // Write enable (active low)                  │
  │      .sx(10'd0),           // Not used (for compatibility)               │
  │      .sy(9'd0),            // Not used (for compatibility)               │
  │      .in_window(sample_en), // Use as write enable for reduced buffer    │
  │      .reduced_addr(thumb_addr), // Address for thumbnail buffer          │
  │      .pixel_idx()          // Not connected                              │
  │  );                                                                      │
  │                                                                          │
  │  // Use in video capture:                                                │
  │  always @(posedge clk) begin                                             │ 
  │      if (!vram_we_n && sample_en) begin                                  │
  │          thumbnail_ram[thumb_addr] <= pixel_data;                        │
  │      end                                                                 │
  │  end                                                                     │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘ 
  ***/

module resize_mapper #(
    parameter ORIG_W = 512,      // Original width (píxels)
    parameter ORIG_H = 480,      // Alto original (píxels)
    parameter REDUCED_W = 64,    // Ancho reducido (píxels)
    parameter REDUCED_H = 60     // Alto reducido (píxels)
) (
    input wire [15:0] a,         // Original buffer address (vc[8:0], hc[8:2])
    input wire we_n,             // Write Enable (active low) distinguish between lectura/escritura
    input wire [9:0] sx,         // Referece pos x (not used)
    input wire [8:0] sy,         // Reference pos y (not used)
    output wire in_window,       // In clipping area
    output wire [$clog2(REDUCED_W * REDUCED_H)-1:0] reduced_addr, // Mapped address in the reduced buffer
    output wire [1:0] pixel_idx  // Pixel index
);

    // Reduction factor rate (original number of pixels per reduced pixels)
    localparam X_SCALE = ORIG_W / REDUCED_W;   // Example, 512/64 = 8
    localparam Y_SCALE = ORIG_H / REDUCED_H;   // Example, 480/60 = 8
    localparam X_SCALE_BITS = $clog2(X_SCALE); // Bits needed for divide x (ex., log2(8) = 3)
    localparam Y_SCALE_BITS = $clog2(Y_SCALE); // Bits needed for divide y (ex., log2(8) = 3)

    localparam X_REDUCED_BITS = $clog2(REDUCED_W); // Ex., log2(64) = 6
    localparam Y_REDUCED_BITS = $clog2(REDUCED_H); // Ex., log2(60) = 6
    localparam ADDR_WIDTH = $clog2(REDUCED_W * REDUCED_H); // Ex., log2(64*60) = 12

    // Extract x, y address segment
    wire [8:0] vc = a[15:7];       //  (y, 0-479)
    wire [8:0] hc = {a[6:0], 2'b00}; // (x, 4 multiply,  4, 0-508)

    // Translated address from original to reduced
    wire [X_REDUCED_BITS-1:0] x_reduced = hc[8:X_SCALE_BITS]; // Divide x by X_SCALE
    wire [Y_REDUCED_BITS-1:0] y_reduced = vc[8:Y_SCALE_BITS]; // Divide y by Y_SCALE

    // Check if we can write in this file (y % Y_SCALE == 0)
    wire [Y_SCALE_BITS-1:0] vc_low = vc[Y_SCALE_BITS-1:0];
    assign in_window = (we_n == 1'b0) ? (vc_low == 0) : 1'b1;

    // Reduced address buffer calculation
    assign reduced_addr = {y_reduced, x_reduced}; // Y_REDUCED_BITS + X_REDUCED_BITS = ADDR_WIDTH

    // Not used by the moment, but maintain it for future enhancements
    assign pixel_idx = hc[1:0]; // Últimos 2 bits de x

endmodule

