/***| SYSTEM.v |

  Copyright (c) 2025 Jesús Arias
  Web: https://www.ele.uva.es/~jesus

  --
   Documentation improved by Carlos Venegas 
   X: @cavearr / Github: @cavearr / FPGAwars: charliva@gmail.com
  --
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                  REAL-TIME MANDELBROT SET GENERATOR                      │
  │                                                                          │
  │  Complete hardware implementation with VGA output, interactive           │
  │  navigation via NES gamepad, and configurable precision                  │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           SYSTEM OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This system implements a complete Mandelbrot set explorer featuring:    ║
  ║                                                                          ║
  ║  • Configurable precision: 24-bit or 32-bit fixed-point arithmetic       ║
  ║  • Real-time fractal generation at 25 MHz pixel clock                    ║
  ║  • VGA output: 512×480 @ 60Hz with 16-color logarithmic palette          ║
  ║  • Interactive navigation: pan and zoom via NES controller               ║
  ║  • External SRAM interface for frame buffering                           ║
  ║  • Pipelined architecture: compute while displaying                      ║
  ║  • Maximum 256 iterations per pixel with escape detection                ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      MANDELBROT ALGORITHM                                │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Mathematical definition:                                                │
  │  ───────────────────────                                                 │
  │  For each pixel at complex coordinate c = x + yi:                        │
  │                                                                          │
  │  z₀ = 0                                                                  │
  │  z_{n+1} = z_n² + c                                                      │
  │                                                                          │
  │  Pixel color = number of iterations before |z| > 2                       │
  │                                                                          │
  │  Hardware implementation:                                                │
  │  ──────────────────────                                                  │
  │  • z = a + bi (complex number in registers)                              │
  │  • z² = (a² - b²) + 2abi                                                 │
  │  • Escape when a² + b² > 4                                               │
  │                                                                          │
  │  Fixed-point format (DW=32 example):                                     │
  │  ┌────┬────────────────┬──────────────────────────────┐                  │
  │  │Sign│  Integer (5b)  │    Fractional (27b)          │                  │
  │  └────┴────────────────┴──────────────────────────────┘                  │
  │   31   30           27  26                           0                   │
  │                                                                          │
  │  Range: [-16, +16) with resolution 2⁻²⁷ ≈ 7.45×10⁻⁹                      │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    PIXEL COMPUTATION PIPELINE                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Clock 0: Start iteration                                                │
  │  ────────────────────────                                                │
  │  • Launch 3 multipliers: a², b², a×b                                     │
  │  • Check previous iteration escape                                       │
  │                                                                          │
  │  Clock 1: Complete iteration                                             │
  │  ────────────────────────                                                │
  │  • a_next = a² - b² + c                                                  │
  │  • b_next = 2×a×b + d                                                    │
  │  • abs² = a² + b²                                                        │
  │  • escape = (abs² > 4) || (iterations >= 256)                            │
  │                                                                          │
  │  Timing per pixel:                                                       │
  │  • Best case: 2 clocks (immediate escape)                                │
  │  • Worst case: 512 clocks (256 iterations)                               │
  │  • Average: ~50-100 clocks for typical views                             │
  │                                                                          │
  │  Pixel throughput:                                                       │
  │  • 25 MHz / 100 clocks = 250K pixels/second                              │
  │  • Full frame: 512×480 / 250K ≈ 1 second                                 │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      SCANNING AND BUFFERING                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Raster scan pattern:                                                    │
  │  ───────────────────                                                     │
  │  ┌─────────────────────────────────────┐                                 │
  │  │ →→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→ ↓│ c: x - 256δ → x + 255δ          │
  │  │ →→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→ ↓│ d: y + 240δ → y - 239δ          │
  │  │ →→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→ ↓│                                 │
  │  │ ... 512 pixels × 480 lines ...      ↓│ δ = zoom level (pixel step)    │
  │  └─────────────────────────────────────┘                                 │
  │                                                                          │
  │  4-pixel packing for SRAM efficiency:                                    │
  │  ───────────────────────────────────                                     │
  │  Pixels:  [0][1][2][3] [4][5][6][7] ...                                  │
  │  SRAM:    [ Word 0   ] [ Word 1   ] ...                                  │
  │           └─16 bits──┘                                                   │
  │                                                                          │
  │  Write timing:                                                           │
  │  • Accumulate 4 pixels in shift register                                 │
  │  • Write to SRAM when pixcnt[1:0] == 3                                   │
  │  • Avoid conflicts with video read cycles                                │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    LOGARITHMIC COLOR PALETTE                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Iteration count to color mapping:                                       │
  │                                                                          │
  │  ┌──────────┬───────┬────────────────────────┐                           │
  │  │Iterations│ Color │ Visual appearance      │                           │
  │  ├──────────┼───────┼────────────────────────┤                           │
  │  │ 0-4      │ 0-4   │ ████ Deep inside set   │                           │
  │  │ 5-6      │ 5     │ ▓▓▓▓ Near boundary     │                           │
  │  │ 7-9      │ 6     │ ▒▒▒▒                   │                           │
  │  │ 10-12    │ 7     │ ░░░░                   │                           │
  │  │ 13-18    │ 8     │ ▄▄▄▄ Transition zone   │                           │
  │  │ 19-25    │ 9     │ ▔▔▔▔                   │                           │
  │  │ 26-35    │ 10    │ ····                   │                           │
  │  │ 36-49    │ 11    │ ····                   │                           │
  │  │ 50-68    │ 12    │ ˙˙˙˙ Outer regions     │                           │
  │  │ 69-95    │ 13    │ ˙˙˙˙                   │                           │
  │  │ 96-132   │ 14    │ ˙˙˙˙                   │                           │
  │  │ 133-255  │ 15    │ ░░░░ Far from set      │                           │
  │  └──────────┴───────┴────────────────────────┘                           │
  │                                                                          │
  │  Logarithmic spacing reveals more detail near the set boundary           │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      NES CONTROLLER INTERFACE                            │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Button mapping for Mandelbrot navigation:                               │
  │                                                                          │
  │      D-Pad                    A/B Buttons                                │
  │      [↑]                      [B] [A]                                    │
  │   [←] + [→]                    ↓   ↓                                     │
  │      [↓]                    Zoom Zoom                                    │
  │       ↓                      Out  In                                     │
  │   Pan view                                                               │
  │                                                                          │
  │  Navigation parameters:                                                  │
  │  • Pan step: 16 × current zoom level                                     │
  │  • Zoom factor: 2× (multiply/divide delta by 2)                          │
  │  • Updates synchronized to vsync (60 Hz)                                 │
  │                                                                          │
  │  Controller protocol timing:                                             │
  │  ─────────────────────────                                               │
  │  vsync: ▔▔▔▔╲___╱▔▔▔▔  (latch on rising edge)                            │
  │  glat:  ____╱▔▔▔╲____  (12μs pulse)                                      │
  │  gclk:  ▔╲_╱▔╲_╱▔╲_╱   (8 pulses total)                                  │
  │  gin:   =[A][B][SE]...  (serial data)                                    │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
 
  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      EXTERNAL RAM INTERFACE                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Arbitration between compute writes and video reads:                     │
  │                                                                          │
  │  Clock: ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐                                  │
  │        ─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─                                 │
  │                                                                          │
  │  vrd:   ▔╲__╱▔▔▔▔▔▔▔▔▔▔╲__╱▔▔▔▔▔▔▔▔▔                                     │
  │  Access: Read      Write  Read      Write                                │
  │          Video     Pixel  Video     Pixel                                │
  │                                                                          │
  │  Memory map:                                                             │
  │  • Address range: 0x0000 - 0xEFFF (61440 words)                          │
  │  • 512×480 pixels = 245,760 pixels                                       │
  │  • 245,760 / 4 = 61,440 words exactly                                    │
  │                                                                          │
  │  Signal timing:                                                          │
  │  • xoe: Active during video reads                                        │
  │  • xwe: Active during pixel writes (when vrd=0)                          │
  │  • Write pulse generated on falling edge of clk                          │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/


module SYSTEM (
    input clk,        // Main clock input 25MHz
    input reset,      // Global reset (active high)
    output xwe,       // External RAM: WE (active low)
    output xoe,       // External RAM: OE (active low)
    output [15:0] xa, // External RAM: address bus
    output [15:0] xdo,// External RAM: output data
    input [15:0] xdi, // External RAM: input data
    output hsyn,      // Horizontal Sync. (active low, every 32us)
    output vsyn,      // Vertical Sync. (active low, every 525 lines)
    output [11:0] video, // RGB444 output
    input [7:0] pinin,   // Input port (includes MISO)
    output [7:0] pinout, // Output port (includes SCK, MOSI, /SS_flash, and /SS_SD)
    //output pwmout,     // Audio output (1-bit, it can be PWM modulated)
    input rxd,         // UART
    output txd,
    output sck,        // SPI
    output mosi,
    input miso,
    output fss,        // Flash SS
    output sss,        // SD SS
    output gclk,       // Game controller clock
    output glat,       // Game controller latch
    input gin,          // Game controller input
    output wire [9:0] hc,
    output wire [9:0] vc
    //,output deb0,
    //output deb1
);

parameter DW = 32;    // Data width for variables

/////////////////////////////
// Pixel computing datapath
/////////////////////////////
reg [DW-1:0] a = 0;   // Real part of Z
reg [DW-1:0] b = 0;   // Imaginary part of Z

wire [DW-1:0] a2;
wire [DW-1:0] b2;
wire [DW-1:0] ab;
wire [DW:0] abs2;

// Multipliers
fix_mpy #(.DW(DW), .FRAC_BITS(DW-5)) fmul0 (.md(a), .mr(a), .out(a2));
fix_mpy #(.DW(DW), .FRAC_BITS(DW-5)) fmul1 (.md(b), .mr(a), .out(ab));
fix_mpy #(.DW(DW), .FRAC_BITS(DW-5)) fmul2 (.md(b), .mr(b), .out(b2));

assign abs2 = a2 + b2;    // Square of the absolute value of Z
wire plus4;               // Higher than 4
assign plus4 = abs2[DW] | abs2[DW-1] | abs2[DW-2] | abs2[DW-3];

reg [8:0] icount = 0;     // Iteration counter
wire init;                // Init signal
assign init = plus4 | (icount[8]);

// Sequential logic
always @(posedge clk) begin
    a <= init ? 0 : a2 - b2 + c;
    b <= init ? 0 : {ab[DW-2:0], 1'b0} + d;
    icount <= init ? 0 : icount + 1;
end

///////////////////////////////////////////////////
// Image scanning
///////////////////////////////////////////////////
reg [DW-1:0] c = 3584 << (DW-12); // Real part of C
reg [DW-1:0] d = 200 << (DW-12);  // Imaginary part of C
reg [DW-1:0] x = -(96 << (DW-12)); // Center Position (real)
reg [DW-1:0] y = 0;               // Center Position (imaginary)
reg [DW-12:0] delta = 1 << (DW-12); // Pixel step

reg [11:0] pix3;             // Three last pixels
reg [15:0] pix4;             // Buffer for 4 pixels
reg [17:0] pixcnt = 0;       // Pixel counter
reg [15:0] waddr;            // Write address
reg wpend = 0;               // Write pending

wire [3:0] pix;              // Pixel color
// Logarithmic scale for colors
assign pix = (icount[7:0] > 133) ? 15 : (
             (icount[7:0] > 96) ? 14 : (
             (icount[7:0] > 69) ? 13 : (
             (icount[7:0] > 50) ? 12 : (
             (icount[7:0] > 36) ? 11 : (
             (icount[7:0] > 26) ? 10 : (
             (icount[7:0] > 19) ? 9 : (
             (icount[7:0] > 13) ? 8 : (
             (icount[7:0] > 10) ? 7 : (
             (icount[7:0] >= 7) ? 6 : (
             (icount[7:0] >= 5) ? 5 : icount[3:0] ))))))))));

// Sequential logic
always @(posedge clk) begin
    if (init) begin
        // Increment pixel counter, reset at end of frame
        if (pixcnt == (512 * 480 - 1)) begin
            pixcnt <= 0;
        end else begin
            pixcnt <= pixcnt + 1;
        end

        // Pixel shifting
        pix3 <= {pix3[7:0], pix};

        // Update c: reset at end of row, increment otherwise
        c <= (pixcnt[8:0] == 511) ? (x - {delta, 8'h0}) : (c + delta);

        // Update d: reset at end of frame, decrement otherwise
        if (pixcnt[8:0] == 511) begin
            d <= (pixcnt[17:9] == 479) ? (y + {delta, 8'h0} - {delta, 4'h0}) : (d - delta);
        end

        // Write every 4 pixels
        if (pixcnt[1:0] == 2'b11) begin
            pix4 <= {pix3, pix};
            // Ensure waddr stays within valid range
            waddr <= pixcnt[17:2] < 16'd61440 ? pixcnt[17:2] : 16'd0;
            wpend <= 1;
        end
    end

    // Clear wpend when write is completed
    if (wpend && ~vrd) begin
        wpend <= 0;
    end
end

//////////////////////////////////
// VIDEO generator
//////////////////////////////////
wire vrd;        // Video reads memory if 1
wire [15:0] va;  // Video address for read

videomodule video0 (.clk(clk), .d(xdi), .a(va), .vrd(vrd),
                    .hsyn(hsyn), .vsyn(vsyn), .video(video),.hc(hc),.vc(vc));

//////////////////////////////////
// External RAM
//////////////////////////////////
assign xdo = pix4;           // Write data
assign xa = vrd ? va : waddr; // Memory address
assign xoe = ~vrd;           // Output enable (active low)
assign xwe = ~((wpend & (~vrd)) & (~clk)); // Write enable (active low)

/////////////////////////////////////////
// NES game controller and position logic
/////////////////////////////////////////
reg [2:0] gcnt = 0;
reg [7:0] gbut;

assign gclk = vsyn;
assign glat = gclk & (gcnt == 0);

always @(posedge gclk) begin
    gcnt <= gcnt + 1;
    if (gcnt == 7) begin
        if (gbut[0]) x <= x - {delta, 4'h0};
        else if (gbut[1]) x <= x + {delta, 4'h0};
        if (gbut[2]) y <= y + {delta, 4'h0};
        else if (gbut[3]) y <= y - {delta, 4'h0};
        if (gbut[6] & (~delta[DW-12])) delta <= {delta[DW-13:0], 1'b0};
        else if (gbut[7] & (~delta[0])) delta <= {1'b0, delta[DW-12:1]};
    end
end
always @(negedge gclk) begin
    gbut <= {gbut[6:0], ~gin};
end

endmodule
