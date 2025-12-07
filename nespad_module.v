/***| nespad_module.v |
  
  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com
 
  This work is dedicated to the public domain under the Creative Commons 
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s) 
  have waived all copyright and related or neighboring rights to this work 
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/
 
  -- Citing authorship is a personal ethical decision -- 

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      NES CONTROLLER PROTOCOL EMULATOR                    │
  │                                                                          │
  │  Emulates the NES gamepad serial protocol, allowing any 8-button         │
  │  parallel input device to interface with systems expecting NES pads      │
  │  Based on: https://tresi.github.io/nes/                                  │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                         NES CONTROLLER PROTOCOL                          ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  The NES controller uses a simple serial protocol with 3 signals:        ║
  ║  • LATCH: Loads button states into shift register                        ║
  ║  • CLOCK: Shifts out one bit per falling edge                            ║
  ║  • DATA:  Serial output (active low: 0 = pressed, 1 = not pressed)       ║
  ║                                                                          ║
  ║  Inside the controller is a 4021 8-bit parallel-to-serial shift          ║
  ║  register that captures all button states simultaneously.                ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                           BUTTON MAPPING                                 │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  NES Controller Layout:            Button Order (MSB first):             │
  │  ─────────────────────             ────────────────────────              │
  │                                                                          │
  │      [↑]                           Bit 7: A                              │
  │   [←] + [→]     [SELECT] [START]   Bit 6: B                              │
  │      [↓]                           Bit 5: SELECT                         │
  │                    [B] [A]         Bit 4: START                          │
  │                                    Bit 3: UP                             │
  │                                    Bit 2: DOWN                           │
  │                                    Bit 1: LEFT                           │
  │                                    Bit 0: RIGHT                          │
  │                                                                          │
  │  buttons[7:0] = {A, B, SELECT, START, UP, DOWN, LEFT, RIGHT}             │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         PROTOCOL TIMING DIAGRAM                          │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  LATCH:  ────┐     ┌─────────────────────────────────────                │
  │              └─────┘                                                     │
  │              12 μs                                                       │
  │                                                                          │
  │  CLOCK:  ────┐   ┌─┐   ┌─┐   ┌─┐   ┌─┐   ┌─┐   ┌─┐   ┌─┐   ┌─────        │
  │              └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘             │
  │                6μs  6μs                                                  │
  │                                                                          │
  │  DATA:   ────[ A ][ B ][SEL][STA][UP ][DWN][LFT][RGT]──────────          │
  │               MSB                                 LSB                    │
  │                                                                          │
  │  Notes:                                                                  │
  │  • LATCH pulse loads all 8 button states in parallel                     │
  │  • Each CLOCK falling edge shifts out one bit                            │
  │  • DATA changes on falling edge, should be read on rising edge           │
  │  • After 8 clocks, DATA remains high until next LATCH                    │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      SHIFT REGISTER OPERATION                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Initial state (after LATCH with A and B pressed):                       │
  │  ┌───┬───┬───┬───┬───┬───┬───┬───┐                                       │
  │  │ 0 │ 0 │ 1 │ 1 │ 1 │ 1 │ 1 │ 1 │  gin = shift_reg[7] = 0 (A)           │
  │  └───┴───┴───┴───┴───┴───┴───┴───┘                                       │
  │    7   6   5   4   3   2   1   0                                         │
  │                                                                          │
  │  After 1st clock (shift left, insert 1):                                 │
  │  ┌───┬───┬───┬───┬───┬───┬───┬───┐                                       │
  │  │ 0 │ 1 │ 1 │ 1 │ 1 │ 1 │ 1 │ 1 │  gin = 0 (B)                          │
  │  └───┴───┴───┴───┴───┴───┴───┴───┘                                       │
  │                                                                          │
  │  After 2nd clock:                                                        │
  │  ┌───┬───┬───┬───┬───┬───┬───┬───┐                                       │
  │  │ 1 │ 1 │ 1 │ 1 │ 1 │ 1 │ 1 │ 1 │  gin = 1 (SELECT not pressed)         │
  │  └───┴───┴───┴───┴───┴───┴───┴───┘                                       │
  │                                                                          │
  │  ... continues for all 8 bits ...                                        │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                        IMPLEMENTATION DETAILS                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Key design decisions:                                                   │
  │                                                                          │
  │  1. Active-low logic: buttons input is active-high (1 = pressed)         │
  │     but NES protocol expects active-low, so we invert on load            │
  │                                                                          │
  │  2. Clock edge detection: Uses gclk_prev to detect falling edges         │
  │     This ensures shifts occur at the correct time                        │
  │                                                                          │
  │  3. Idle state: Shift register fills with 1s after all data sent         │
  │     This matches real NES controller behavior                            │
  │                                                                          │
  │  4. Synchronous reset: All operations synchronized to system clock       │
  │     for reliable FPGA implementation                                     │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                            USAGE EXAMPLE                                 │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Instance for converting parallel buttons to NES protocol             │
  │  nespad_module nes_emulator (                                            │
  │      .clk(sys_clk),           // System clock (e.g., 50 MHz)             │
  │      .reset(sys_reset),       // Active high reset                       │
  │      .gclk(nes_clock),        // Clock from NES (typically ~60 Hz)       │
  │      .glat(nes_latch),        // Latch signal from NES                   │
  │      .gin(nes_data),          // Serial data to NES                      │
  │      .buttons({               // Map your buttons to NES format          │
  │          btn_a,               // bit 7: A button                         │
  │          btn_b,               // bit 6: B button                         │
  │          btn_select,          // bit 5: SELECT                           │
  │          btn_start,           // bit 4: START                            │
  │          btn_up,              // bit 3: UP                               │
  │          btn_down,            // bit 2: DOWN                             │
  │          btn_left,            // bit 1: LEFT                             │
  │          btn_right            // bit 0: RIGHT                            │
  │      })                                                                  │
  │  );                                                                      │
  │                                                                          │
  │  // Note: gclk is often tied to video vsync (~60 Hz) in NES systems      │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          REFERENCE RESOURCES                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  • NES Controller Protocol: https://tresi.github.io/nes/                 │
  │  • 4021 Shift Register Datasheet (CD4021B)                               │
  │  • NES Development Wiki: https://www.nesdev.org/                         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/

module nespad_module (
    input wire clk,              // System clock
    input wire reset,            // Reset input (active high)
    input wire gclk,             // Gamepad clock (from SYSTEM, tied to vsyn)
    input wire glat,             // Gamepad latch signal
    output wire gin,             // Serial data output to SYSTEM
    input wire [7:0] buttons     // Button states from sim_main.cpp
);
    reg [7:0] shift_reg = 8'hFF; // Shift register, initialized to all 1s
    reg gclk_prev;               // Register to store previous gclk value
    assign gin = shift_reg[7];   // gin outputs the MSB of shift_reg

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 8'hFF;  // Reset to all 1s (no buttons pressed)
            gclk_prev <= 0;      // Reset previous gclk state
        end else begin
            gclk_prev <= gclk;   // Store current gclk for next cycle
            if (glat) begin
                shift_reg <= ~buttons; // Load negated buttons
            end else if (gclk == 0 && gclk_prev == 1) begin // Falling edge of gclk
                shift_reg <= {shift_reg[6:0], 1'b1}; // Shift left, insert 1
            end
        end
    end
endmodule
