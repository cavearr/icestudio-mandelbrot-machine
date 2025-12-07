/***| sram_model.v |
  
  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com
 
  This work is dedicated to the public domain under the Creative Commons 
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s) 
  have waived all copyright and related or neighboring rights to this work 
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/
 
  -- Citing authorship is a personal ethical decision -- 
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                   WINDOWED ASYNC SRAM SIMULATION MODEL                   │
  │                                                                          │
  │  Synchronous model emulating asynchronous SRAM with window-based         │
  │  addressing for video buffer applications (based on CY7C1041GN)          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module simulates an asynchronous SRAM for Verilator environments   ║
  ║  with special window-based addressing for video applications:            ║
  ║                                                                          ║
  ║  • Emulates 256K×16-bit async SRAM interface                             ║
  ║  • Implements windowed addressing for video buffer regions               ║
  ║  • Synchronous internals for reliable simulation                         ║
  ║  • Byte-wide write control (high/low byte enables)                       ║
  ║  • Designed for SIMRETRO board simulations                               ║
  ║    https://www.ele.uva.es/~jesus/SIMRETRO/index.html                     ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                        MEMORY ORGANIZATION                               │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Physical Interface:           Actual Storage:                           │
  │  ──────────────────           ───────────────                            │
  │  256K × 16-bit words          Window-sized buffer                        │
  │  18-bit addressing            (WIN_W × WIN_H) / 4 words                  │
  │                                                                          │
  │  Example for 128×64 window:                                              │
  │  ─────────────────────────                                               │
  │  Total pixels: 128 × 64 = 8,192                                          │
  │  Words needed: 8,192 / 4 = 2,048 (4 pixels per word)                     │
  │  Address bits: log₂(2048) = 11 bits                                      │
  │                                                                          │
  │  Memory Map:                                                             │
  │  ┌─────────────────────────────┐                                         │
  │  │ Word 0: Pixels 0,1,2,3      │ addr = 0x000                            │
  │  │ Word 1: Pixels 4,5,6,7      │ addr = 0x001                            │
  │  │ ...                         │                                         │
  │  │ Word 2047: Last 4 pixels    │ addr = 0x7FF                            │
  │  └─────────────────────────────┘                                         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                     WINDOWED ADDRESSING CONCEPT                          │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Full Address Space (256K):        Active Window:                        │
  │  ─────────────────────────        ──────────────                         │
  │                                                                          │
  │  ┌───────────────────────┐        ┌─────────────┐                        │
  │  │                       │        │░░░░░░░░░░░░░│ ← (sx,sy)              │
  │  │                       │        │░           ░│                        │
  │  │    [Active Window]    │   →    │░  128×64   ░│                        │
  │  │     at (sx,sy)        │        │░           ░│                        │
  │  │                       │        │░░░░░░░░░░░░░│                        │
  │  │                       │        └─────────────┘                        │
  │  └───────────────────────┘         Only this area                        │
  │   18-bit address space              is stored                            │
  │                                                                          │
  │  Address Translation:                                                    │
  │  ──────────────────                                                      │
  │  1. Extract video coordinates from addr[15:0]                            │
  │  2. Check if coordinates fall within window                              │
  │  3. Map to window-relative address if valid                              │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      ASYNC SRAM CONTROL SIGNALS                          │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Signal   Active  Function                                               │
  │  ──────   ──────  ────────                                               │
  │  CE#      Low     Chip Enable - activates the SRAM                       │
  │  OE#      Low     Output Enable - drives data bus for reads              │
  │  WE#      Low     Write Enable - writes data to memory                   │
  │  BHE#     Low     Byte High Enable - enables bits [15:8]                 │
  │  BLE#     Low     Byte Low Enable - enables bits [7:0]                   │
  │                                                                          │
  │  Operation Truth Table:                                                  │
  │  ─────────────────────                                                   │
  │  ┌─────┬─────┬─────┬──────┬──────┬────────────────┐                      │
  │  │ CE# │ OE# │ WE# │ BHE# │ BLE# │ Operation      │                      │
  │  ├─────┼─────┼─────┼──────┼──────┼────────────────┤                      │
  │  │  1  │  X  │  X  │  X   │  X   │ Standby        │                      │
  │  │  0  │  0  │  1  │  0   │  0   │ Read word      │                      │
  │  │  0  │  0  │  1  │  1   │  0   │ Read low byte  │                      │
  │  │  0  │  0  │  1  │  0   │  1   │ Read high byte │                      │
  │  │  0  │  X  │  0  │  0   │  0   │ Write word     │                      │
  │  │  0  │  X  │  0  │  1   │  0   │ Write low byte │                      │
  │  │  0  │  X  │  0  │  0   │  1   │ Write high byte│                      │
  │  └─────┴─────┴─────┴──────┴──────┴────────────────┘                      │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    TIMING EMULATION STRATEGY                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Real Async SRAM:              This Model:                               │
  │  ───────────────              ──────────                                 │
  │                                                                          │
  │  Write Timing:                 Write on posedge clk:                     │
  │  ────────────                  ────────────────────                      │
  │        ┌─────┐                      ┌─┐ ┌─┐                              │
  │  WE#: ─┘     └─────           clk: ─┘ └─┘ └─                             │
  │        ↑     ↑                      ↑                                    │
  │     Setup  Hold                  Sample                                  │
  │                                                                          │
  │  Read Timing:                  Read on posedge clk:                      │
  │  ───────────                   ───────────────────                       │
  │        ┌─────────┐                  ┌─┐ ┌─┐                              │
  │  OE#: ─┘         └─           clk: ─┘ └─┘ └─                             │
  │          ←tAA→                         ↑                                 │
  │  Data: ─────<valid>─           data_valid goes high                      │
  │                                                                          │
  │  Key differences:                                                        │
  │  • Synchronous sampling vs asynchronous response                         │
  │  • data_valid flag indicates when output is ready                        │
  │  • Single cycle latency for all operations                               │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      PIXEL PACKING FORMAT                                │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Four pixels packed into one 16-bit word:                                │
  │                                                                          │
  │  Word format:                                                            │
  │  ┌────┬────┬────┬────┐                                                   │
  │  │ P3 │ P2 │ P1 │ P0 │  16-bit word                                      │
  │  └────┴────┴────┴────┘                                                   │
  │   15-12 11-8 7-4  3-0                                                    │
  │                                                                          │
  │  Screen mapping (example for first row):                                 │
  │  ───────────────────────────────────────                                 │
  │  Screen pixels: 0  1  2  3  4  5  6  7  ...                              │
  │  Word 0:       [0][1][2][3]                                              │
  │  Word 1:                   [4][5][6][7]                                  │
  │                                                                          │
  │  Address calculation:                                                    │
  │  word_addr = (y * WIDTH + x) / 4                                         │
  │  pixel_pos = x % 4                                                       │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         USAGE EXAMPLE                                    │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Instantiate SRAM model for 128×64 video window                       │
  │  sram_model #(                                                           │
  │      .WIN_W(128),          // Window width in pixels                     │
  │      .WIN_H(64)            // Window height in pixels                    │
  │  ) video_sram (                                                          │
  │      .clk(sys_clk),        // System clock                               │
  │      .addr(mem_addr),      // 18-bit address                             │
  │      .data_in(write_data), // Data to write                              │
  │      .data_out(read_data), // Data read out                              │
  │      .data_valid(valid),   // Read data is valid                         │
  │      .in_window(in_win),   // Address is in window                       │
  │      .ce_n(chip_enable_n), // Chip enable (active low)                   │
  │      .oe_n(output_en_n),   // Output enable (active low)                 │
  │      .we_n(write_en_n),    // Write enable (active low)                  │
  │      .bhe_n(1'b0),         // High byte enable (active low)              │
  │      .ble_n(1'b0),         // Low byte enable (active low)               │
  │      .sx(window_x),        // Window X position                          │
  │      .sy(window_y)         // Window Y position                          │
  │  );                                                                      │
  │                                                                          │
  │  // Write sequence                                                       │
  │  always @(posedge clk) begin                                             │
  │      if (write_pixel) begin                                              │
  │          mem_addr <= pixel_address;                                      │
  │          write_data <= pixel_data;                                       │
  │          ce_n <= 1'b0;                                                   │
  │          we_n <= 1'b0;                                                   │
  │      end                                                                 │
  │  end                                                                     │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                            KNOWN LIMITATIONS                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  • Read has +1 offset bug: data_out <= memory[win_addr+1]                │
  │  • Byte enables only support full word operations currently              │
  │  • No timing delays modeled (instantaneous operations)                   │
  │  • Window checker module must be available                               │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/ 

module sram_model (
    input wire clk,              // Clock input
    input wire [17:0] addr,      // 18-bit address (256K words)
    input wire [15:0] data_in,   // 16-bit data input
    output reg [15:0] data_out,  // 16-bit data output
    output reg data_valid,       // Indicates valid data_out
    output wire in_window,       // Señal de depuración para in_window
    input wire ce_n,             // Chip Enable (active low)
    input wire oe_n,             // Output Enable (active low)
    input wire we_n,             // Write Enable (active low)
    input wire bhe_n,            // Byte High Enable (active low)
    input wire ble_n,            // Byte Low Enable (active low)
    input wire [9:0] sx,         // Window x-position (multiple of 4)
    input wire [8:0] sy          // Window y-position
);

    parameter WIN_W = 128;       
    parameter WIN_H = 64;       

     // Video buffer: (WIN_W * WIN_H) / 4
    localparam MEM_SIZE = (WIN_W * WIN_H) >> 2; 
    parameter ADDR_WIDTH = $clog2(MEM_SIZE);
    reg [15:0] memory [0:MEM_SIZE-1];  // 4096 words for default params

    wire [ADDR_WIDTH-1:0] win_addr;        // Mapped address
    wire check_window;

    window_checker #(    .winW(WIN_W),
        .winH(WIN_H)
 ) window_inst (
        .a(addr[15:0]),          // addr[15:0] = {vc[8:0], hc[8:2]}
        .sx(sx),
        .sy(sy),
             .in_window(check_window),
        .win_addr(win_addr)
    );

    always @(posedge clk) begin
        if (ce_n == 1'b0 && we_n == 1'b0 && (bhe_n == 1'b0 || ble_n == 1'b0) ) begin
            if (ble_n == 1'b0 && bhe_n == 1'b0  && check_window) begin
                // Write all bits
                memory[win_addr] <= data_in;
            end 
         end
    end
  
    assign in_window = check_window;

    always @(posedge clk) begin

        // Default outputs
         data_valid <= 1'b0; // data_out retains previous value when invalid
        if (ce_n == 1'b0 && we_n == 1'b1 && oe_n == 1'b0) begin
            // Read operation
            if (ble_n == 1'b0 && bhe_n == 1'b0  && check_window) begin
                // Read all bits
                data_valid <= 1'b1;
                data_out <= memory[win_addr+1];
              end 
        end else begin
            data_valid <= 1'b0;
        end
      end
endmodule

