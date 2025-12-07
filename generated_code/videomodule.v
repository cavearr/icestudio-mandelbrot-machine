/***| videomodule.v |***
  
  Copyright (c) 2025 Jesús Arias
  Web: https://www.ele.uva.es/~jesus
 
  --
   Documentation improved by Carlos Venegas 
   X: @cavearr / Github: @cavearr / FPGAwars: charliva@gmail.com
  --

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    VGA VIDEO SIGNAL GENERATOR                            │
  │                                                                          │
  │  Generates VGA timing signals and reads pixel data from external         │
  │  memory with CGA-like color palette expansion                            │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module generates standard VGA video signals:                       ║
  ║                                                                          ║
  ║  • 512×480 active display area (non-standard)                            ║
  ║  • 800×525 total timing (standard VGA)                                   ║
  ║  • Reads packed pixels from external memory (4 pixels/word)              ║
  ║  • Expands 4-bit pixels to 12-bit RGB using CGA palette                  ║
  ║  • Generates proper hsync/vsync timing                                   ║
  ║  • Optimized memory access pattern                                       ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         VGA TIMING DIAGRAM                               │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Horizontal Timing (800 pixels total @ 25.175 MHz = 31.778 μs):          │
  │  ──────────────────────────────────────────────────────────────          │
  │                                                                          │
  │  ┌─────────────────┬────┬──────────┬────┐                                │
  │  │ Active Display  │FP  │  HSync   │BP  │                                │
  │  │   512 pixels    │80  │96 pixels │112 │                                │
  │  └─────────────────┴────┴──────────┴────┘                                │
  │   0               511  591        687  799                               │
  │                                                                          │
  │  hc:     0 ─────────► 511 ───► 591 ───► 687 ───► 799 → 0                 │
  │  hsyn:   ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔╲___________╱▔▔▔▔▔▔▔▔                    │
  │  hblk:   ________________________╱▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔╲                   │
  │                                                                          │
  │  Vertical Timing (525 lines total @ 60 Hz = 16.667 ms):                  │
  │  ──────────────────────────────────────────────────────                  │
  │                                                                          │
  │  ┌─────────────────┬────┬────┬────┐                                      │
  │  │ Active Display  │FP  │VS  │BP  │                                      │
  │  │   480 lines     │10  │ 2  │33  │                                      │
  │  └─────────────────┴────┴────┴────┘                                      │
  │   0               479  489 491  524                                      │
  │                                                                          │
  │  vc:     0 ─────────► 479 ─► 489 ─► 491 ───► 524 → 0                     │
  │  vsyn:   ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔╲_____╱▔▔▔▔▔▔▔▔▔▔▔▔▔▔                       │
  │  vblk:   ____________________╱▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔╲                      │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      MEMORY ACCESS PATTERN                               │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Memory organization: 4 pixels packed per 16-bit word                    │
  │                                                                          │
  │  Address calculation:                                                    │
  │  ──────────────────                                                      │
  │  a[15:0] = {vc[8:0], hc[8:2]}                                            │
  │             └──┬──┘  └──┬──┘                                             │
  │           line (y)   word in line (x/4)                                  │
  │                                                                          │
  │  Memory read timing:                                                     │
  │  ─────────────────                                                       │ 
  │  hc[1:0]: 00  01  10  11  00  01  10  11                                 │
  │  vrd:     ▔╲__╱▔▔▔▔▔▔▔▔▔▔▔╲__╱▔▔▔▔▔▔▔▔▔                                  │
  │  Read:    ↑               ↑                                              │
  │           Word n          Word n+1                                       │
  │                                                                          │
  │  Pixel shift register operation:                                         │
  │  ─────────────────────────────                                           │
  │                                                                          │
  │  Read word:  [P3][P2][P1][P0]  (16 bits)                                 │
  │               15  11   7   3                                             │
  │                                                                          │
  │  Clock 0: Output P3, shift → [P2][P1][P0][X]                             │
  │  Clock 1: Output P2, shift → [P1][P0][X][X]                              │
  │  Clock 2: Output P1, shift → [P0][X][X][X]                               │
  │  Clock 3: Output P0, load new word                                       │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    CGA COLOR PALETTE EXPANSION                           │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  4-bit pixel to 12-bit RGB mapping (CGA-inspired):                       │
  │                                                                          │
  │  Pixel bits: [I][R][G][B]                                                │
  │               3  2  1  0                                                 │
  │               │  │  │  └─ Blue component                                 │
  │               │  │  └──── Green component                                │
  │               │  └─────── Red component                                  │
  │               └────────── Intensity/brightness                           │
  │                                                                          │
  │  Color expansion logic:                                                  │
  │  ─────────────────────                                                   │
  │  R[3:0] = {pixel[2], pixel[3], pixel[2], pixel[3]}                       │
  │  G[3:0] = {pixel[1], pixel[3], pixel[1], pixel[3]}                       │
  │  B[3:0] = {pixel[0], pixel[3], pixel[0], pixel[3]}                       │
  │                                                                          │
  │  CGA 16-color palette:                                                   │
  │  ┌────┬─────────────┬────────────────┬─────────┐                         │
  │  │Hex │ I R G B     │ Color          │ RGB444  │                         │
  │  ├────┼─────────────┼────────────────┼─────────┤                         │
  │  │ 0  │ 0 0 0 0     │ Black          │ #000    │                         │
  │  │ 1  │ 0 0 0 1     │ Blue           │ #00A    │                         │
  │  │ 2  │ 0 0 1 0     │ Green          │ #0A0    │                         │
  │  │ 3  │ 0 0 1 1     │ Cyan           │ #0AA    │                         │
  │  │ 4  │ 0 1 0 0     │ Red            │ #A00    │                         │
  │  │ 5  │ 0 1 0 1     │ Magenta        │ #A0A    │                         │
  │  │ 6  │ 0 1 1 0     │ Brown          │ #AA0    │                         │
  │  │ 7  │ 0 1 1 1     │ Light Gray     │ #AAA    │                         │
  │  │ 8  │ 1 0 0 0     │ Dark Gray      │ #555    │                         │
  │  │ 9  │ 1 0 0 1     │ Light Blue     │ #55F    │                         │
  │  │ A  │ 1 0 1 0     │ Light Green    │ #5F5    │                         │
  │  │ B  │ 1 0 1 1     │ Light Cyan     │ #5FF    │                         │
  │  │ C  │ 1 1 0 0     │ Light Red      │ #F55    │                         │
  │  │ D  │ 1 1 0 1     │ Light Magenta  │ #F5F    │                         │
  │  │ E  │ 1 1 1 0     │ Yellow         │ #FF5    │                         │
  │  │ F  │ 1 1 1 1     │ White          │ #FFF    │                         │
  │  └────┴─────────────┴────────────────┴─────────┘                         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         SIGNAL DESCRIPTIONS                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Inputs:                                                                 │
  │  • clk: 25.175 MHz pixel clock                                           │
  │  • d[15:0]: Data from external RAM (4 pixels)                            │
  │                                                                          │
  │  Outputs:                                                                │
  │  • a[15:0]: Memory address for next word                                 │
  │  • hsyn: Horizontal sync (active low)                                    │
  │  • vsyn: Vertical sync (active low)                                      │
  │  • video[11:0]: RGB output (4 bits per channel)                          │
  │  • vrd: Memory read strobe (active high)                                 │
  │  • hblk/vblk: Blanking signals                                           │
  │  • hc/vc: Current pixel position                                         │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLE                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Instantiate video generator                                          │
  │  videomodule vga_gen (                                                   │
  │      .clk(clk_25mhz),      // 25.175 MHz clock                           │
  │      .d(ram_data),         // Data from RAM                              │
  │      .a(ram_addr),         // Address to RAM                             │
  │      .hsyn(vga_hsync),     // To VGA connector                           │
  │      .vsyn(vga_vsync),     // To VGA connector                           │
  │      .video(vga_rgb),      // To VGA DAC                                 │
  │      .vrd(ram_read_en),    // RAM read enable                            │
  │      .hblk(h_blank),       // Horizontal blanking                        │
  │      .vblk(v_blank),       // Vertical blanking                          │
  │      .hc(pixel_x),         // Current X coordinate                       │
  │      .vc(pixel_y)          // Current Y coordinate                       │
  │  );                                                                      │
  │                                                                          │
  │  // Connect to external SRAM                                             │
  │  assign sram_addr = ram_addr;                                            │
  │  assign sram_oe_n = ~ram_read_en;                                        │
  │  assign ram_data = sram_data_out;                                        │
  │                                                                          │
  │  // Connect to VGA DAC                                                   │
  │  assign vga_r = vga_rgb[11:8];  // Red 4 bits                            │
  │  assign vga_g = vga_rgb[7:4];   // Green 4 bits                          │
  │  assign vga_b = vga_rgb[3:0];   // Blue 4 bits                           │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/ 

 module videomodule (
    input clk,        // Clock input @25MHz
    input [15:0] d,   // Data read from external RAM
    output [15:0] a,  // External RAM address
    output reg hsyn,  // Horizontal sync pulse (active low)
    output reg vsyn,  // Vertical sync pulse (active low)
    output [11:0] video, // Video output (12 bits/pixel)
    output vrd,       // Video read
    output reg hblk,  // Horizontal blank
    output reg vblk,  // Vertical blank
    output reg [9:0] hc, // Horizontal counter
    output reg [9:0] vc // Vertical counter
);

// Horizontal section
// Total: 800 pixels (32 us)
// Displayed: 512 pixels
// hsync width: 96 pixels
initial hc = 0;    // Horizontal counter
initial hsyn = 1;  // Sync
initial hblk = 0;  // Blank output (active if pixel >= 512)
always @(posedge clk) begin
    if (hc == 10'd799) begin
        hc <= 0;
        hblk <= 0;
    end else
        hc <= hc + 1;
    if (hc == 10'd591)
        hsyn <= 0;
    if (hc == 10'd687)
        hsyn <= 1;
    if (hc == 10'd511)
        hblk <= 1;
end

// Vertical section
// Total: 525 lines
// Displayed: 480 lines
// vsync width: 2 lines
initial vc = 0;  // Vertical Counter
initial vsyn = 1;  // Sync
initial vblk = 0;  // Blank output (active if line >= 480)
always @(negedge hblk) begin
    if (vc == 10'd524) begin
        vc <= 0;
        vblk <= 0;
    end else
        vc <= vc + 1;
    if (vc == 10'd489)
        vsyn <= 0;
    if (vc == 10'd491)
        vsyn <= 1;
    if (vc == 10'd479)
        vblk <= 1;
end

// Global Blank
wire blk;
assign blk = hblk | vblk;

// Memory Address
assign a = {vc[8:0], hc[8:2]};

// Video read
assign vrd = (~blk) & (~hc[1]) & (~hc[0]);
reg [15:0] vsh;
always @(posedge clk) begin
    if (hc == 10'd0) begin
        vsh <= 16'h0000; // Reset vsh to black at start of line
    end else begin
        vsh <= vrd ? d : {vsh[11:0], 4'b0000}; // Shift with black pixels
    end
end

reg dblk = 0;    // Blk delayed
always @(posedge clk)
    dblk <= blk;

wire [3:0] pixel;
assign pixel = dblk ? 4'b0000 : vsh[15:12];

// Color palette: CGA-like
assign video[11] = pixel[2]; // R[3]
assign video[10] = pixel[3]; // R[2]
assign video[9] = pixel[2];  // R[1]
assign video[8] = pixel[3];  // R[0]
assign video[7] = pixel[1];  // G[3]
assign video[6] = pixel[3];  // G[2]
assign video[5] = pixel[1];  // G[1]
assign video[4] = pixel[3];  // G[0]
assign video[3] = pixel[0];  // B[3]
assign video[2] = pixel[3];  // B[2]
assign video[1] = pixel[0];  // B[1]
assign video[0] = pixel[3];  // B[0]

endmodule
