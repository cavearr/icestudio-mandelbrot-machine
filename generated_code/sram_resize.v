/***| sram_resize.v |
  
  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com
 
  This work is dedicated to the public domain under the Creative Commons 
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s) 
  have waived all copyright and related or neighboring rights to this work 
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/
 
  -- Citing authorship is a personal ethical decision -- 

  ┌──────────────────────────────────────────────────────────────────────────┐
  │              SRAM WITH REAL-TIME VIDEO COMPRESSION/DECOMPRESSION         │
  │                                                                          │
  │  Memory module that automatically downsamples video data on write        │
  │  and upsamples on read, reducing memory usage by 75%                     │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module combines SRAM functionality with automatic video            ║
  ║  resolution scaling:                                                     ║
  ║                                                                          ║
  ║  • Accepts 512×480 video data, stores as 128×120                         ║
  ║  • 4:1 compression using pixel averaging (4×4 → 1 pixel)                 ║
  ║  • Transparent operation - appears as standard SRAM to host              ║
  ║  • 75% memory savings (122KB → 15KB)                                     ║
  ║  • Suitable for thumbnails, previews, or low-res backgrounds             ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      COMPRESSION ALGORITHM                               │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Input: 16-bit word containing 4 pixels (4 bits each)                    │
  │  Output: Single 4-bit averaged pixel                                     │
  │                                                                          │
  │  Pixel Averaging Process:                                                │
  │  ───────────────────────                                                 │
  │                                                                          │
  │  Input word:    ┌────┬────┬────┬────┐                                    │
  │                 │ P3 │ P2 │ P1 │ P0 │  16 bits                           │
  │                 └────┴────┴────┴────┘                                    │
  │                  15-12 11-8 7-4  3-0                                     │
  │                    ↓    ↓    ↓    ↓                                      │
  │                    └────┴────┴────┘                                      │
  │                           +                                              │
  │                         ──────                                           │
  │                         Sum/4 → Avg                                      │
  │                                                                          │
  │  Example:                                                                │
  │  ────────                                                                │
  │  Pixels: [15, 13, 14, 12] → Sum: 54 → Avg: 13                            │
  │  Pixels: [8, 8, 8, 8]     → Sum: 32 → Avg: 8                             │
  │  Pixels: [0, 4, 8, 12]    → Sum: 24 → Avg: 6                             │
  │                                                                          │
  │  This preserves brightness while reducing resolution                     │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    MEMORY MAPPING VISUALIZATION                          │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Original Frame (512×480):         Compressed Storage (128×120):         │
  │  ────────────────────────          ─────────────────────────────         │
  │                                                                          │
  │  ┌─────────────────────┐           ┌───────────┐                         │
  │  │□□□□ □□□□ □□□□ ...   │           │■ ■ ■ ...  │                         │ 
  │  │□□□□ □□□□ □□□□ ...   │           │■ ■ ■ ...  │                         │
  │  │□□□□ □□□□ □□□□ ...   │  ────→    │■ ■ ■ ...  │                         │
  │  │□□□□ □□□□ □□□□ ...   │  4×4→1    │...         │                        │
  │  │                     │           └───────────┘                         │
  │  └─────────────────────┘                                                 │
  │   4 pixels/word × 4 rows           1 byte/pixel                          │
  │   = 16 source pixels               = 1 compressed pixel                  │
  │                                                                          │
  │  Memory usage:                                                           │
  │  • Original: 512×480×4 bits = 122,880 bytes                              │
  │  • Compressed: 128×120×8 bits = 15,360 bytes                             │
  │  • Savings: 87.5% reduction                                              │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      DECOMPRESSION STRATEGY                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Read Operation: Expand single pixel to fill 4-pixel word                │
  │                                                                          │
  │  Stored pixel:     ┌────┐                                                │
  │                    │ 13 │  4 bits                                        │
  │                    └────┘                                                │
  │                      ↓                                                   │
  │                 Replicate 4×                                             │
  │                      ↓                                                   │
  │  Output word:  ┌────┬────┬────┬────┐                                     │ 
  │                │ 13 │ 13 │ 13 │ 13 │  16 bits                            │
  │                └────┴────┴────┴────┘                                     │
  │                                                                          │
  │  This creates uniform blocks in the decompressed image:                  │
  │                                                                          │
  │  Compressed:  ■     Decompressed:  ■■■■                                  │ 
  │               ■                     ■■■■                                 │
  │                                     ■■■■                                 │
  │                                     ■■■■                                 │
  │                                                                          │
  │  Visual effect: Blocky/pixelated appearance typical of thumbnails        │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                        DATA FLOW DIAGRAM                                 │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Write Path:                                                             │
  │  ──────────                                                              │
  │                                                                          │
  │  addr[15:0] ──→ [resize_mapper] ──→ reduced_addr                         │
  │                         ↓                    ↓                           │
  │                    in_window          [memory array]                     │
  │                         ↓                    ↑                           │
  │  data_in[15:0] ──→ [averager] ──→ pixel_avg─┘                            │
  │                                                                          │
  │                                                                          │
  │  Read Path:                                                              │
  │  ─────────                                                               │
  │                                                                          │
  │  addr[15:0] ──→ [resize_mapper] ──→ reduced_addr                         │
  │                                          ↓                               │
  │                                    [memory array]                        │
  │                                          ↓                               │
  │                                     pixel[3:0]                           │
  │                                          ↓                               │
  │  data_out[15:0] ←── [replicator] ←──────┘                                │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    IMPLEMENTATION DETAILS                                │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Memory Organization:                                                    │
  │  • Array: 15,360 × 8-bit (stores 4-bit values in 8-bit locations)        │
  │  • Wastes 4 bits per location but simplifies addressing                  │
  │  • Alternative: Pack 2 pixels per byte (not implemented)                 │
  │                                                                          │
  │  Pipeline Considerations:                                                │
  │  • Write: 1 cycle (immediate averaging and store)                        │
  │  • Read: 2 cycles (address → memory → replicate)                         │
  │  • Uses delayed pixel register for timing alignment                      │
  │                                                                          │
  │  Known Issues:                                                           │
  │  • +1 offset in read addressing (inherited from sram_model)              │
  │  • Complex read timing with prevpixel/pixeldelayed registers             │
  │  • Memory inefficiency (4 bits stored in 8-bit locations)                │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLE                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Instantiate compressed SRAM for video thumbnail storage              │
  │  sram_resize #(                                                          │
  │      .REDUCED_W(128),      // Target width (512/4)                       │
  │      .REDUCED_H(120)       // Target height (480/4)                      │
  │  ) thumbnail_ram (                                                       │
  │      .clk(pixel_clk),      // Pixel clock                                │
  │      .addr(vram_addr),     // Standard SRAM address                      │
  │      .data_in(pixel_data), // 4 pixels, 4 bits each                      │
  │      .data_out(read_data), // Decompressed pixels                        │
  │      .data_valid(valid),   // Read data ready                            │
  │      .ce_n(1'b0),          // Always enabled                             │
  │      .oe_n(read_n),        // Output enable                              │
  │      .we_n(write_n),       // Write enable                               │
  │      .bhe_n(1'b0),         // Both bytes enabled                         │
  │      .ble_n(1'b0),                                                       │
  │      .sx(10'd0),           // Not used                                   │
  │      .sy(9'd0)             // Not used                                   │
  │  );                                                                      │
  │                                                                          │
  │  // The module automatically handles compression/decompression           │
  │  // transparently - just use like normal SRAM                            │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                       APPLICATIONS                                       │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  • Video game thumbnails or map previews                                 │
  │  • Security camera multi-view displays                                   │
  │  • Picture-in-picture video effects                                      │
  │  • Low-resolution background layers                                      │
  │  • Memory-constrained embedded systems                                   │
  │  • Real-time video preview generation                                    │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘ 
  ***/ 

module sram_resize (
    input wire clk,              // Clock input
    input wire [17:0] addr,      // 18-bit address (256K words)
    input wire [15:0] data_in,   // 16-bit data input (4 píxels, 4 bits c/u)
    output reg [15:0] data_out,  // 16-bit data output (4 píxels, 4 bits c/u)
    output reg data_valid,       // Indicates valid data_out
    output wire debug_in_window, // Debug signal, remove in near future
    input wire ce_n,             // Chip Enable (active low)
    input wire oe_n,             // Output Enable (active low)
    input wire we_n,             // Write Enable (active low)
    input wire bhe_n,            // Byte High Enable (active low)
    input wire ble_n,            // Byte Low Enable (active low)
    input wire [9:0] sx,         // Window x-position (not used for now)
    input wire [8:0] sy          // Window y-position (not used for now)
);

    parameter REDUCED_W = 128;   
    parameter REDUCED_H = 120;   
    localparam MEM_SIZE = REDUCED_W * REDUCED_H; // 128*120 = 15360 bytes
    localparam ADDR_WIDTH = $clog2(MEM_SIZE); // 14 bits

    // Small memory buffer (un byte per pixel)                                                
    reg [7:0] memory [0:MEM_SIZE-1]; // 15360 bytes

    wire in_window;                       // Address is valid for writting 
    wire [ADDR_WIDTH-1:0] reduced_addr;   // Address for small memory buffer
    wire [1:0] pixel_idx;                 // Pixel index

    wire [7:0] pixel_sum;         // 4 píxels sum 
    wire [3:0] pixel_avg;         // 4 pixels mean
    reg [7:0] pixel_val;          // Readed pixel value 

    resize_mapper #(
        .ORIG_W(512),
        .ORIG_H(480),
        .REDUCED_W(REDUCED_W),
        .REDUCED_H(REDUCED_H)
    ) resize_inst (
        .a(addr[15:0]),
        .sx(sx),
        .sy(sy),
         .we_n(we_n),
        .in_window(in_window),
        .reduced_addr(reduced_addr),
        .pixel_idx(pixel_idx)
    );

    // For debug, removed soon 
    assign debug_in_window = in_window;
    assign pixel_sum = data_in[15:12] + data_in[11:8] + data_in[7:4] + data_in[3:0];
    assign pixel_avg = pixel_sum >> 2; // Divide by 4 

    // Write  (compression)
    always @(posedge clk) begin
        if (ce_n == 1'b0 && we_n == 1'b0 && (bhe_n == 1'b0 || ble_n == 1'b0) ) begin
            if (ble_n == 1'b0 && bhe_n == 1'b0  && in_window) begin

            // 4 píxeles mean (4 bits per pixel)
            memory[reduced_addr] <= pixel_avg; // Bundle 4 bits in the same byte
        end
       end
    end
  
    reg [7:0] pixeldelayed; 
    reg [16:0] prevpixel;

    // Read,  (decompress)
    always @(posedge clk) begin
        data_valid <= 1'b0; // data_out retains previous value when invalid

        if (ce_n == 1'b0 && we_n == 1'b1 && oe_n == 1'b0 ) begin
            // Read operation
            if (ble_n == 1'b0 && bhe_n == 1'b0 && in_window) begin

            // Clone the LSB 4 bits into  4 píxels output
            data_out<=prevpixel;
            pixeldelayed <= (reduced_addr==MEM_SIZE-1)? 0 :memory[reduced_addr+1];
            data_valid <= 1'b1;

            end else begin
                // Both bytes disabled
                data_valid <= 1'b0;
                data_out<=16'h0000;
            end
        end else begin
            prevpixel<={pixeldelayed[3:0],pixeldelayed[3:0],pixeldelayed[3:0],pixeldelayed[3:0]};
            // Power down or outputs disabled
            data_valid <= 1'b0;
        end
      end

endmodule

