/***| window_mapping.v |

  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com

  This work is dedicated to the public domain under the Creative Commons
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s)
  have waived all copyright and related or neighboring rights to this work
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/

  -- Citing authorship is a personal ethical decision --

  ┌──────────────────────────────────────────────────────────────────────────┐
  │              JOYSTICK TO WINDOW POSITION MAPPER                          │
  │                                                                          │
  │  Maps analog joystick position to movable window coordinates             │
  │  Handles asymmetric joystick centers with automatic compensation         │
  └──────────────────────────────────────────────────────────────────────────┘

  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module maps joystick analog position (from ADC) to the top-left    ║
  ║  corner coordinates of a movable window on screen, providing:            ║
  ║                                                                          ║
  ║  • Asymmetric center compensation for cheap/worn joysticks               ║
  ║  • Automatic amplify/reduce detection per axis side                      ║
  ║  • Pure shift-based scaling (no multipliers, minimal LCs)                ║
  ║  • Robust clamping to prevent window from leaving screen bounds          ║
  ║  • Consistent LC usage regardless of parameter values                    ║
  ║                                                                          ║
  ║  Designed for ice40 FPGAs with very limited logic resources.             ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         SIGNAL FLOW DIAGRAM                              │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Joystick      Delta        Scale         Offset       Clamp    Output   │
  │  Position      Calc         (shift)       Apply                          │
  │  ────────      ─────        ───────       ──────       ─────    ──────   │
  │                                                                          │
  │   10-bit   →  ┌──────┐  →  ┌───────┐  →  ┌──────┐  →  ┌─────┐ → 10-bit   │
  │  [0,1023]     │ |Δ|  │     │ << or │     │ CTR± │     │0-MAX│   [0,448]  │
  │   pos_x       └──────┘     │ >>    │     └──────┘     └─────┘   winx     │
  │                delta       └───────┘      wx_raw                         │
  │                             scaled                                       │
  │                                                                          │
  │  Same pipeline for Y axis (pos_y → winy)                                 │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    ASYMMETRIC JOYSTICK PROBLEM                           │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Cheap joysticks (like Arduino KY-023) often have off-center rest:       │
  │                                                                          │
  │  Ideal Joystick:              Real Joystick (worn/cheap):                │
  │  ────────────────              ──────────────────────────                │
  │                                                                          │
  │   0 ─────┼───── 1023           0 ───────────────┼── 1023                 │
  │         512                                   800                        │
  │       center                               center                        │
  │   ←─512─→←─511─→               ←────800────→←223→                        │
  │    equal range                   unequal ranges!                         │
  │                                                                          │
  │  Without compensation:                                                   │
  │  • Window starts offset from screen center                               │
  │  • One direction feels "heavy", other feels "light"                      │
  │  • May not reach screen edges                                            │
  │                                                                          │
  │  This module compensates by using different scale factors per side.      │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      SCALING STRATEGY                                    │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  For each side of each axis, we calculate:                               │
  │                                                                          │
  │    factor = window_range / joystick_range                                │
  │                                                                          │
  │  Two cases:                                                              │
  │  ───────────                                                             │
  │                                                                          │
  │  CASE 1: factor < 1 (REDUCE) - joystick has MORE range than window       │
  │  ┌─────────────────────────────────────────────────────────────┐         │
  │  │  Joystick: 0 ←──────── 800 steps ────────→ CENTER           │         │
  │  │  Window:   0 ←──── 224 pixels ────→ CENTER                  │         │
  │  │                                                             │         │
  │  │  factor = 224/800 = 0.28 ≈ 1/4                              │         │
  │  │  Implementation: scaled = delta >> 2                        │         │
  │  └─────────────────────────────────────────────────────────────┘         │
  │                                                                          │
  │  CASE 2: factor > 1 (AMPLIFY) - joystick has LESS range than window      │
  │  ┌─────────────────────────────────────────────────────────────┐         │
  │  │  Joystick: CENTER ←── 24 steps ──→ 1023                     │         │
  │  │  Window:   CENTER ←── 224 pixels ─→ MAX                     │         │
  │  │                                                             │         │
  │  │  factor = 224/24 = 9.3 ≈ 8                                  │         │
  │  │  Implementation: scaled = delta << 3                        │         │
  │  └─────────────────────────────────────────────────────────────┘         │
  │                                                                          │
  │  Shift values are computed at synthesis time using log2(ratio).          │
  │  This ensures ZERO multipliers and consistent LC usage.                  │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    COORDINATE SYSTEM                                     │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Screen Layout (640×480):                                                │
  │  ────────────────────────                                                │
  │                                                                          │
  │  (0,0)──────────────────────────────────────────────(639,0)              │
  │    │                                                    │                │
  │    │     (winx,winy)                                    │                │
  │    │         ┌──────────────────┐                       │                │
  │    │         │                  │                       │                │
  │    │         │  Movable Window  │ HEIGHT                │                │
  │    │         │    (192×100)     │                       │                │
  │    │         │                  │                       │                │
  │    │         └──────────────────┘                       │                │
  │    │              WIDTH                                 │                │
  │    │                                                    │                │
  │  (0,479)────────────────────────────────────────────(639,479)            │
  │                                                                          │
  │  Window Movement Range:                                                  │
  │  ─────────────────────                                                   │
  │  • winx: 0 to (MAX_W - WIDTH)  = 0 to 448                               │
  │  • winy: 0 to (MAX_H - HEIGHT) = 0 to 380                               │
  │                                                                          │
  │  Center Position (when joystick at rest):                                │
  │  • winx = 224 (window horizontally centered)                             │
  │  • winy = 190 (window vertically centered)                               │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      PARAMETER EXAMPLES                                  │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Example 1: Good joystick (center ≈ 512)                                 │
  │  ────────────────────────────────────────                                │
  │  POS_CENTER_X = 512, WINX_CTR = 224                                      │
  │                                                                          │
  │  │ Side │ Joy Range │ Win Range │ Factor │ Mode   │ Shift │              │
  │  │──────│───────────│───────────│────────│────────│───────│              │
  │  │ Left │    512    │    224    │  0.44  │ Reduce │  >> 1 │              │
  │  │ Right│    512    │    224    │  0.44  │ Reduce │  >> 1 │              │
  │                                                                          │
  │  Example 2: Bad joystick (center = 800)                                  │
  │  ────────────────────────────────────────                                │
  │  POS_CENTER_X = 800, WINX_CTR = 224                                      │
  │                                                                          │
  │  │ Side │ Joy Range │ Win Range │ Factor │ Mode   │ Shift │              │
  │  │──────│───────────│───────────│────────│────────│───────│              │
  │  │ Left │    800    │    224    │  0.28  │ Reduce │  >> 2 │              │
  │  │ Right│    224    │    224    │  1.0   │ Reduce │  >> 0 │              │
  │                                                                          │
  │  Example 3: Very bad joystick (center = 1000)                            │
  │  ─────────────────────────────────────────────                           │
  │  POS_CENTER_X = 1000, WINX_CTR = 224                                     │
  │                                                                          │
  │  │ Side │ Joy Range │ Win Range │ Factor │ Mode    │ Shift │             │
  │  │──────│───────────│───────────│────────│─────────│───────│             │
  │  │ Left │   1000    │    224    │  0.22  │ Reduce  │  >> 2 │             │
  │  │ Right│     24    │    224    │  9.3   │ Amplify │  << 3 │             │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         CLAMPING LOGIC                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Two-stage clamping ensures window stays within screen bounds:           │
  │                                                                          │
  │  Stage 1: Pre-clamp scaled value to WIN_CTR                              │
  │  ──────────────────────────────────────────                              │
  │  Prevents overflow when adding/subtracting from center:                  │
  │                                                                          │
  │    if (scaled > WIN_CTR) scaled = WIN_CTR                                │
  │                                                                          │
  │  Stage 2: Final clamp to valid range                                     │
  │  ────────────────────────────────────                                    │
  │                                                                          │
  │    if (result < 0)       output = 0                                      │
  │    else if (result > MAX) output = MAX                                   │
  │    else                   output = result                                │
  │                                                                          │
  │  This handles edge cases like:                                           │
  │  • Amplification overflow (scaled >> WIN_CTR)                            │
  │  • Subtraction underflow (negative result)                               │
  │  • Addition overflow (result > WIN_MAX)                                  │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         RESOURCE USAGE                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Optimized for ice40HX4K with minimal logic:                             │
  │                                                                          │
  │  • Multipliers: 0 (pure shift-based scaling)                             │
  │  • Registers: 2 × 10-bit (winx, winy outputs only)                       │
  │  • Combinational: ~100-150 LCs typical                                   │
  │                                                                          │
  │  LC count is CONSTANT regardless of POS_CENTER values because:           │
  │  • Shift amounts are compile-time constants                              │
  │  • Barrel shifters use same logic for any shift value                    │
  │  • No runtime multiplication or division                                 │
  │                                                                          │
  │  Trade-off:                                                              │
  │  ───────────                                                             │
  │  • Precision: Uses power-of-2 approximation (up to ±50% factor error)    │
  │  • For UI/game use: Perfectly acceptable (clamping hides imprecision)    │
  │  • For precise control: Use 2-term version (shift ± correction)          │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLE                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  // Measure your joystick center values first!                           │
  │  // Put joystick at rest and read ADC values for X and Y                 │
  │                                                                          │
  │  window_mapping #(                                                       │
  │      .POS_WIDTH(10),           // 10-bit joystick input (0-1023)         │
  │      .POS_CENTER_X(10'd800),   // Measured X center (rest position)      │
  │      .POS_CENTER_Y(10'd400),   // Measured Y center (rest position)      │
  │      .WIDTH(192),              // Window width in pixels                 │
  │      .HEIGHT(100),             // Window height in pixels                │
  │      .MAX_W(640),              // Screen width                           │
  │      .MAX_H(480)               // Screen height                          │
  │  ) win_map (                                                             │
  │      .clk(clk),                // System clock                           │
  │      .rst(rst),                // Active-high reset                      │
  │      .pos_x(joy_x),            // Joystick X from ADC/filter             │
  │      .pos_y(joy_y),            // Joystick Y from ADC/filter             │
  │      .winx(window_x),          // Output: window top-left X              │
  │      .winy(window_y)           // Output: window top-left Y              │
  │  );                                                                      │
  │                                                                          │
  │  // On reset: window appears centered on screen                          │
  │  // Move joystick: window follows smoothly                               │
  │  // At extremes: window stops at screen edges                            │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/


module window_mapping #(
    parameter POS_WIDTH    = 10,
    parameter POS_CENTER_X = 800,
    parameter POS_CENTER_Y = 400,
    parameter WIDTH        = 192,
    parameter HEIGHT       = 100,
    parameter MAX_W        = 640,
    parameter MAX_H        = 480
)(
    input  wire                 clk,
    input  wire                 rst,
    input  wire [POS_WIDTH-1:0] pos_x,
    input  wire [POS_WIDTH-1:0] pos_y,
    output reg  [POS_WIDTH-1:0] winx,
    output reg  [POS_WIDTH-1:0] winy
);

    // ──────────────────────────────────────────────────────────────────────
    // Window range constants
    // ──────────────────────────────────────────────────────────────────────
    localparam [POS_WIDTH-1:0] WINX_MAX = MAX_W - WIDTH;
    localparam [POS_WIDTH-1:0] WINY_MAX = MAX_H - HEIGHT;
    localparam [POS_WIDTH-1:0] WINX_CTR = WINX_MAX >> 1;
    localparam [POS_WIDTH-1:0] WINY_CTR = WINY_MAX >> 1;
    localparam [POS_WIDTH:0]   POS_MAX  = {1'b1, {POS_WIDTH{1'b0}}}; // 1024

    // ──────────────────────────────────────────────────────────────────────
    // Joystick ranges per side (protected against zero)
    // ──────────────────────────────────────────────────────────────────────
    localparam integer RNG_L_X = (POS_CENTER_X > 0) ? POS_CENTER_X : 1;
    localparam integer RNG_R_X = (POS_MAX - POS_CENTER_X > 0) ? (POS_MAX - POS_CENTER_X) : 1;
    localparam integer RNG_U_Y = (POS_CENTER_Y > 0) ? POS_CENTER_Y : 1;
    localparam integer RNG_D_Y = (POS_MAX - POS_CENTER_Y > 0) ? (POS_MAX - POS_CENTER_Y) : 1;

    // ──────────────────────────────────────────────────────────────────────
    // Synthesis-time functions for shift calculation
    // ──────────────────────────────────────────────────────────────────────

    // Calculate floor(log2(x)), minimum 0
    function integer log2floor;
        input integer x;
        integer tmp;
        begin
            log2floor = 0;
            tmp = x;
            while (tmp > 1) begin
                tmp = tmp >> 1;
                log2floor = log2floor + 1;
            end
        end
    endfunction

    // Calculate optimal shift for scaling (with rounding)
    function integer calc_shift;
        input integer rng_joy, rng_win;
        begin
            if (rng_joy >= rng_win)
                calc_shift = log2floor((rng_joy + rng_win/2) / rng_win);
            else
                calc_shift = log2floor((rng_win + rng_joy/2) / rng_joy);
        end
    endfunction

    // ──────────────────────────────────────────────────────────────────────
    // Compile-time constants: amplify flags and shift amounts
    // ──────────────────────────────────────────────────────────────────────

    // Amplify flag: 1 = joystick range < window range (need to amplify)
    localparam AMP_L_X = (RNG_L_X < WINX_CTR) ? 1 : 0;
    localparam AMP_R_X = (RNG_R_X < WINX_CTR) ? 1 : 0;
    localparam AMP_U_Y = (RNG_U_Y < WINY_CTR) ? 1 : 0;
    localparam AMP_D_Y = (RNG_D_Y < WINY_CTR) ? 1 : 0;

    // Shift amounts (computed at synthesis)
    localparam [3:0] SH_L_X = calc_shift(RNG_L_X, WINX_CTR);
    localparam [3:0] SH_R_X = calc_shift(RNG_R_X, WINX_CTR);
    localparam [3:0] SH_U_Y = calc_shift(RNG_U_Y, WINY_CTR);
    localparam [3:0] SH_D_Y = calc_shift(RNG_D_Y, WINY_CTR);

    // ──────────────────────────────────────────────────────────────────────
    // Runtime logic
    // ──────────────────────────────────────────────────────────────────────

    // Side detection (which side of center is the joystick?)
    wire x_right = (pos_x >= POS_CENTER_X[POS_WIDTH-1:0]);
    wire y_down  = (pos_y >= POS_CENTER_Y[POS_WIDTH-1:0]);

    // Absolute delta from center
    wire [POS_WIDTH-1:0] dx = x_right ? (pos_x - POS_CENTER_X[POS_WIDTH-1:0])
                                      : (POS_CENTER_X[POS_WIDTH-1:0] - pos_x);
    wire [POS_WIDTH-1:0] dy = y_down  ? (pos_y - POS_CENTER_Y[POS_WIDTH-1:0])
                                      : (POS_CENTER_Y[POS_WIDTH-1:0] - pos_y);

    // Scaled values (amplify or reduce based on side)
    wire [POS_WIDTH+3:0] sx_wide;
    assign sx_wide = x_right ?
        (AMP_R_X ? (dx << SH_R_X) : (dx >> SH_R_X)) :
        (AMP_L_X ? (dx << SH_L_X) : (dx >> SH_L_X));

    wire [POS_WIDTH+3:0] sy_wide;
    assign sy_wide = y_down ?
        (AMP_D_Y ? (dy << SH_D_Y) : (dy >> SH_D_Y)) :
        (AMP_U_Y ? (dy << SH_U_Y) : (dy >> SH_U_Y));

    // Pre-clamp scaled value to center range (prevents overflow)
    wire [POS_WIDTH-1:0] sx = (sx_wide > WINX_CTR) ? WINX_CTR[POS_WIDTH-1:0] : sx_wide[POS_WIDTH-1:0];
    wire [POS_WIDTH-1:0] sy = (sy_wide > WINY_CTR) ? WINY_CTR[POS_WIDTH-1:0] : sy_wide[POS_WIDTH-1:0];

    // Final position: center ± scaled offset
    wire [POS_WIDTH:0] wx = x_right ? (WINX_CTR + sx) : (WINX_CTR - sx);
    wire [POS_WIDTH:0] wy = y_down  ? (WINY_CTR + sy) : (WINY_CTR - sy);

    // ──────────────────────────────────────────────────────────────────────
    // Output register with final clamping
    // ──────────────────────────────────────────────────────────────────────
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            winx <= WINX_CTR;
            winy <= WINY_CTR;
        end else begin
            // Clamp X to [0, WINX_MAX]
            if (wx[POS_WIDTH])
                winx <= 0;
            else if (wx[POS_WIDTH-1:0] > WINX_MAX)
                winx <= WINX_MAX;
            else
                winx <= wx[POS_WIDTH-1:0];

            // Clamp Y to [0, WINY_MAX]
            if (wy[POS_WIDTH])
                winy <= 0;
            else if (wy[POS_WIDTH-1:0] > WINY_MAX)
                winy <= WINY_MAX;
            else
                winy <= wy[POS_WIDTH-1:0];
        end
    end

endmodule
