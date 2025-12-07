/***| joystick_controller.v |

  Copyright (c) 2025 Carlos Venegas <carlos@magnitude.es>
  X: @cavearr | github: @cavearr | FPGAwars: charliva@gmail.com

  This work is dedicated to the public domain under the Creative Commons
  Zero (CC0) 1.0 Universal. To the extent possible under law, the author(s)
  have waived all copyright and related or neighboring rights to this work
  worldwide. No rights are reserved.
  Full text: https://creativecommons.org/publicdomain/zero/1.0/

  -- Citing authorship is a personal ethical decision --

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    ANALOG JOYSTICK CONTROLLER                            │
  │                                                                          │
  │  IIR-filtered joystick decoder with auto-calibration and hysteresis      │
  │  for stable directional output from noisy ADC readings                   │
  └──────────────────────────────────────────────────────────────────────────┘

  ╔══════════════════════════════════════════════════════════════════════════╗
  ║                           MODULE OVERVIEW                                ║
  ╠══════════════════════════════════════════════════════════════════════════╣
  ║                                                                          ║
  ║  This module processes analog joystick signals from a 12-bit ADC with:   ║
  ║  • IIR low-pass filtering to smooth noisy ADC readings                   ║
  ║  • Automatic center calibration on startup                               ║
  ║  • Continuous re-centering when joystick is at rest                      ║
  ║  • Hysteresis-based direction detection (up/down/left/right)             ║
  ║  • Support for diagonal directions                                       ║
  ║  • Configurable bit reduction (12→10 bits by default)                    ║
  ║                                                                          ║
  ╚══════════════════════════════════════════════════════════════════════════╝

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                       ANALOG JOYSTICK BASICS                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  An analog joystick uses two potentiometers for X and Y axes:            │
  │                                                                          │
  │                    ▲ Y+                                                  │
  │                    │                                                     │
  │               ┌────┼────┐                                                │
  │               │    │    │                                                │
  │          X- ──┼────●────┼── X+                                           │
  │               │    │    │                                                │
  │               └────┼────┘                                                │
  │                    │                                                     │
  │                    ▼ Y-                                                  │
  │                                                                          │
  │  ADC output range (12-bit): 0x000 to 0xFFF (0 to 4095)                   │
  │  Center position (ideal):   0x800 (2048)                                 │
  │                                                                          │
  │  Real joysticks have problems:                                           │
  │  • Center drift: Rest position ≠ 0x800                                   │
  │  • Noise: 3-4 LSB fluctuation even when stationary                       │
  │  • Non-linearity: Movement may not be perfectly proportional             │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         IIR FILTERING                                    │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Infinite Impulse Response (IIR) filter smooths ADC noise:               │
  │                                                                          │
  │  Formula: x_filt = x_filt + (x_adc - x_filt) >> FILTER_SHIFT             │
  │                                                                          │
  │  This is equivalent to: x_filt = α·x_adc + (1-α)·x_filt                  │
  │  where α = 1/2^FILTER_SHIFT                                              │
  │                                                                          │
  │  ┌────────────────────┬──────────┬──────────────────────────┐            │
  │  │ FILTER_SHIFT       │   α      │ Behavior                 │            │
  │  ├────────────────────┼──────────┼──────────────────────────┤            │
  │  │      1             │  0.500   │ Fast response, less smooth│           │
  │  │      2 (default)   │  0.250   │ Balanced                 │            │
  │  │      3             │  0.125   │ Smoother, more lag       │            │
  │  │      4             │  0.0625  │ Very smooth, high lag    │            │
  │  └────────────────────┴──────────┴──────────────────────────┘            │
  │                                                                          │
  │  Signal comparison:                                                      │
  │  ────────────────────                                                    │
  │  Raw ADC:      ╱╲╱╲╱╲─────╱╲╱╲╱╲╱╲                                        │
  │                ↑ noise      ↑ noise                                      │
  │                                                                          │
  │  Filtered:     ─────────────────────                                     │
  │                (stable output)                                           │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      CENTER CALIBRATION                                  │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  On reset, the module calibrates the joystick center position:           │
  │                                                                          │
  │  Phase 1 - Initial calibration (2^CALIB_SHIFT samples):                  │
  │  ─────────────────────────────────────────────────────                   │
  │                                                                          │
  │  Timeline:                                                               │
  │  ────────────────────────────────────────────                            │
  │    Reset ──►│ Sample 0 │ Sample 1 │...│ Sample N │──► Calibrated         │
  │             └────────── accumulate ──────────────┘                       │
  │                                                                          │
  │  center = Σ(samples) >> CALIB_SHIFT                                      │
  │                                                                          │
  │  Example (CALIB_SHIFT=5, 32 samples):                                    │
  │  • Joystick rests slightly off-center at ~2100                           │
  │  • After 32 samples: center = 2100 (not default 2048)                    │
  │  • Direction detection now uses real center                              │
  │                                                                          │
  │  Phase 2 - Continuous re-centering (when at rest):                       │
  │  ────────────────────────────────────────────────                        │
  │  If joystick stays within RECENTER_BAND for 2^RECENTER_SHIFT samples,    │
  │  the center is updated to correct for drift over time.                   │
  │                                                                          │
  │  │←── RECENTER_BAND ──→│                                                 │
  │  │                     │                                                 │
  │  ├─────────●───────────┤  ● = current position                           │
  │           center                                                         │
  │                                                                          │
  │  This prevents the joystick from "sticking" in a direction               │
  │  after prolonged use or temperature changes.                             │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                    HYSTERESIS FOR DIRECTIONS                             │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  Without hysteresis, small noise causes direction flickering:            │
  │                                                                          │
  │  Position:  ─────────────●─────────────                                  │
  │                    threshold                                             │
  │  Output:    ON─OFF─ON─OFF─ON─OFF─ON    (flickering!)                     │
  │                                                                          │
  │  With hysteresis, two thresholds prevent flickering:                     │
  │                                                                          │
  │  Position scale (relative to center):                                    │
  │  ────────────────────────────────────────────────────────────            │
  │                                                                          │
  │      -DELTA_ON   -DELTA_OFF    0    +DELTA_OFF   +DELTA_ON               │
  │          ▼            ▼        ▼         ▼            ▼                  │
  │  ◄───────┼────────────┼────────●─────────┼────────────┼───────►          │
  │    LEFT  │    (dead   │     center       │    (dead   │  RIGHT           │
  │    zone  │     zone)  │                  │     zone)  │  zone            │
  │          │            │                  │            │                  │
  │                                                                          │
  │  State machine for each direction:                                       │
  │  ─────────────────────────────────                                       │
  │                                                                          │
  │     ┌─────────┐  |delta| > DELTA_ON   ┌─────────┐                        │
  │     │   OFF   │ ─────────────────────►│   ON    │                        │
  │     │         │◄───────────────────── │         │                        │
  │     └─────────┘  |delta| < DELTA_OFF  └─────────┘                        │
  │                                                                          │
  │  Example values (10-bit output, range 0-1023):                           │
  │  • DELTA_ON  = 48  → Activate at ~5% from center                         │
  │  • DELTA_OFF = 32  → Deactivate at ~3% from center                       │
  │  • Dead zone = 16 counts of hysteresis                                   │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      DIAGONAL DIRECTIONS                                 │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  The module supports diagonal directions (e.g., UP+RIGHT):               │
  │                                                                          │
  │         UP              UP+RIGHT                                         │
  │          ▲               ╱                                               │
  │          │              ╱                                                │
  │  LEFT ◄──●──► RIGHT    ●                                                 │
  │          │                                                               │
  │          ▼                                                               │
  │        DOWN                                                              │
  │                                                                          │
  │  AXIS_MARGIN parameter controls diagonal behavior:                       │
  │                                                                          │
  │  AXIS_MARGIN = 0 (default):                                              │
  │  • Diagonals always allowed                                              │
  │  • Both horizontal and vertical signals can be active                    │
  │                                                                          │
  │  AXIS_MARGIN > 0:                                                        │
  │  • Filters small cross-axis movements                                    │
  │  • Only activates direction if: |axis| + MARGIN >= |other_axis|          │
  │  • Prevents accidental diagonals from hand tremor                        │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                         TIMING & SAMPLING                                │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  The module uses two clocks:                                             │
  │                                                                          │
  │  clk  (25 MHz): Main system clock for all logic                          │
  │  mclk (pulse):  Sample clock indicating new ADC data ready               │
  │                                                                          │
  │  Timing diagram:                                                         │
  │  ───────────────                                                         │
  │                                                                          │
  │  clk:    ┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐                        │
  │          ┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└                        │
  │                                                                          │
  │  mclk:   ────┐     ┌────────────────┐     ┌─────                         │
  │              └─────┘                └─────┘                              │
  │              ↑                      ↑                                    │
  │          new sample            new sample                                │
  │                                                                          │
  │  Recommended mclk frequency: 500 Hz - 2 kHz                              │
  │  • Lower = more lag, less CPU load                                       │
  │  • Higher = faster response, more processing                             │
  │  • 1 kHz is a good balance for gaming applications                       │
  │                                                                          │
  │  For 25 MHz system clock:                                                │
  │  • Divider of 25,000 → 1 kHz sample rate                                 │
  │  • Divider of 12,500 → 2 kHz sample rate                                 │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                      PARAMETER REFERENCE                                 │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  ┌────────────────────┬─────────┬─────────────────────────────────┐      │
  │  │ Parameter          │ Default │ Description                     │      │
  │  ├────────────────────┼─────────┼─────────────────────────────────┤      │
  │  │ FILTER_SHIFT       │    2    │ IIR filter strength (2^N)       │      │
  │  │ OUTPUT_SHIFT       │    2    │ Bits to discard (12→10 bits)    │      │
  │  │ DELTA_ON           │   48    │ Threshold to activate direction │      │
  │  │ DELTA_OFF          │   32    │ Threshold to deactivate         │      │
  │  │ CALIB_SHIFT        │    5    │ Calibration samples (2^N = 32)  │      │
  │  │ RECENTER_BAND      │  200    │ Rest detection window           │      │
  │  │ RECENTER_SHIFT     │    6    │ Re-center samples (2^N = 64)    │      │
  │  │ STABLE_THRESH      │    3    │ Max change for "stable"         │      │
  │  │ AXIS_MARGIN        │    0    │ Diagonal filter margin          │      │
  │  └────────────────────┴─────────┴─────────────────────────────────┘      │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │                          USAGE EXAMPLE                                   │
  ├──────────────────────────────────────────────────────────────────────────┤
  │                                                                          │
  │  joystick_controller #(                                                  │
  │      .FILTER_SHIFT(3),          // Stronger filtering                    │
  │      .DELTA_ON(64),             // Larger dead zone                      │
  │      .DELTA_OFF(48)                                                      │
  │  ) joystick_inst (                                                       │
  │      .clk(clk_25mhz),                                                    │
  │      .mclk(adc_sample_ready),   // Pulse when ADC has new data           │
  │      .rst(reset),                                                        │
  │      .x_adc(adc_x),             // 12-bit X from ADC                     │
  │      .y_adc(adc_y),             // 12-bit Y from ADC                     │
  │      .x_out(joystick_x),        // 10-bit filtered X position            │
  │      .y_out(joystick_y),        // 10-bit filtered Y position            │
  │      .up(joy_up),               // Direction outputs (active high)       │
  │      .down(joy_down),                                                    │
  │      .left(joy_left),                                                    │
  │      .right(joy_right)                                                   │
  │  );                                                                      │
  │                                                                          │
  │  // Direction outputs are active HIGH and compatible with                │
  │  // NES-style controller interfaces (active = pressed)                   │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
  ***/

module joystick_controller #(
    //──────────────────────────────────────────────────────────────────────
    // IIR FILTER PARAMETERS
    //──────────────────────────────────────────────────────────────────────
    // FILTER_SHIFT: Controls filter strength
    // x_filt = x_filt + (x_adc - x_filt) >> FILTER_SHIFT
    // Higher values = stronger filtering, more latency
    parameter integer FILTER_SHIFT = 2,

    // OUTPUT_SHIFT: Bits discarded from 12-bit ADC (12 - OUTPUT_SHIFT = output width)
    // Default: 2 → 10-bit output (0-1023)
    parameter integer OUTPUT_SHIFT = 2,

    //──────────────────────────────────────────────────────────────────────
    // HYSTERESIS THRESHOLDS (relative to calibrated center)
    //──────────────────────────────────────────────────────────────────────
    // DELTA_ON:  Activate direction when |delta| exceeds this value
    // DELTA_OFF: Deactivate direction when |delta| falls below this value
    // DELTA_ON > DELTA_OFF creates a hysteresis band to prevent flickering
    parameter [9:0] DELTA_ON  = 10'd48,
    parameter [9:0] DELTA_OFF = 10'd32,

    //──────────────────────────────────────────────────────────────────────
    // CALIBRATION PARAMETERS
    //──────────────────────────────────────────────────────────────────────
    // CALIB_SHIFT: Number of samples for initial calibration = 2^CALIB_SHIFT
    // Default: 5 → 32 samples averaged to find center at startup
    parameter integer CALIB_SHIFT = 5,

    //──────────────────────────────────────────────────────────────────────
    // RE-CENTERING PARAMETERS (continuous drift correction)
    //──────────────────────────────────────────────────────────────────────
    // RECENTER_BAND: Window size around center for "at rest" detection
    // If |position - center| < RECENTER_BAND, joystick is considered at rest
    parameter [9:0] RECENTER_BAND  = 10'd200,

    // RECENTER_SHIFT: Samples needed for re-centering = 2^RECENTER_SHIFT
    // Default: 6 → 64 consecutive "at rest" samples to update center
    parameter integer RECENTER_SHIFT = 6,

    // STABLE_THRESH: Maximum change between samples to consider position stable
    // Filters out noise during re-centering
    parameter [9:0] STABLE_THRESH = 10'd3,

    //──────────────────────────────────────────────────────────────────────
    // DIAGONAL CONTROL
    //──────────────────────────────────────────────────────────────────────
    // AXIS_MARGIN: Margin for allowing diagonal directions
    // 0 = always allow diagonals
    // >0 = only allow if |axis| + MARGIN >= |other_axis|
    parameter [9:0] AXIS_MARGIN = 10'd0
)(
    //──────────────────────────────────────────────────────────────────────
    // CLOCK AND RESET
    //──────────────────────────────────────────────────────────────────────
    input  wire        clk,       // System clock (e.g., 25 MHz)
    input  wire        mclk,      // Sample clock pulse (new ADC data ready)
    input  wire        rst,       // Synchronous reset (active high)

    //──────────────────────────────────────────────────────────────────────
    // ADC INPUTS (12-bit)
    //──────────────────────────────────────────────────────────────────────
    input  wire [11:0] x_adc,     // X-axis ADC reading (0x000 to 0xFFF)
    input  wire [11:0] y_adc,     // Y-axis ADC reading (0x000 to 0xFFF)

    //──────────────────────────────────────────────────────────────────────
    // FILTERED POSITION OUTPUTS
    //──────────────────────────────────────────────────────────────────────
    output reg  [9:0]  x_out,     // Filtered X position (default: 10-bit)
    output reg  [9:0]  y_out,     // Filtered Y position (default: 10-bit)

    //──────────────────────────────────────────────────────────────────────
    // DIRECTION OUTPUTS (active high, active while held)
    //──────────────────────────────────────────────────────────────────────
    output reg         up,        // Joystick pushed up
    output reg         down,      // Joystick pushed down
    output reg         left,      // Joystick pushed left
    output reg         right      // Joystick pushed right
);

    //══════════════════════════════════════════════════════════════════════
    // LOCAL PARAMETERS
    //══════════════════════════════════════════════════════════════════════

    // Nominal center for 12-bit ADC (4096/2 = 2048)
    localparam [11:0] CENTER_12B = 12'h800;

    // Accumulator width: enough for 2^CALIB_SHIFT samples of 10-bit values
    // 16 bits handles up to 64 samples (2^6) of 10-bit values with margin
    localparam integer ACC_WIDTH = 16;

    //══════════════════════════════════════════════════════════════════════
    // IIR FILTER REGISTERS
    //══════════════════════════════════════════════════════════════════════

    // Internal filtered values in full 12-bit precision
    // (truncation to output width happens only at final stage)
    reg [11:0] x_filt;
    reg [11:0] y_filt;

    //══════════════════════════════════════════════════════════════════════
    // CALIBRATION REGISTERS
    //══════════════════════════════════════════════════════════════════════

    // Calibrated center position (in output bit width)
    reg [9:0]  x_center;
    reg [9:0]  y_center;

    // Accumulators for averaging during calibration
    reg [ACC_WIDTH-1:0] x_acc;
    reg [ACC_WIDTH-1:0] y_acc;

    // Sample counter for calibration phase
    reg [CALIB_SHIFT:0] calib_count;

    // Flag: calibration complete
    reg calib_done;

    //══════════════════════════════════════════════════════════════════════
    // RE-CENTERING REGISTERS (continuous drift correction)
    //══════════════════════════════════════════════════════════════════════

    // Accumulators for re-centering average
    reg [ACC_WIDTH-1:0] x_acc_rec;
    reg [ACC_WIDTH-1:0] y_acc_rec;

    // Counter for consecutive "at rest" samples
    reg [RECENTER_SHIFT:0] recenter_count;

    //══════════════════════════════════════════════════════════════════════
    // SAMPLE CLOCK EDGE DETECTION
    //══════════════════════════════════════════════════════════════════════

    // Two-stage synchronizer for mclk edge detection
    reg mclk_r1, mclk_r2;
    wire mclk_posedge;

    //══════════════════════════════════════════════════════════════════════
    // IIR FILTER COMBINATIONAL LOGIC
    //══════════════════════════════════════════════════════════════════════

    // Error term (signed): difference between raw and filtered
    // Extended to 13 bits for signed arithmetic
    wire signed [12:0] x_err = {1'b0, x_adc} - {1'b0, x_filt};
    wire signed [12:0] y_err = {1'b0, y_adc} - {1'b0, y_filt};

    // Correction term: error scaled by filter factor (arithmetic shift right)
    wire signed [13:0] x_correction = x_err >>> FILTER_SHIFT;
    wire signed [13:0] y_correction = y_err >>> FILTER_SHIFT;

    // Next filtered value: current + correction
    // Extra bit prevents overflow during addition
    wire [13:0] x_sum = {1'b0, x_filt} + x_correction;
    wire [13:0] y_sum = {1'b0, y_filt} + y_correction;

    // Truncate back to 12 bits (overflow not possible with proper filter)
    wire [11:0] x_filt_next = x_sum[11:0];
    wire [11:0] y_filt_next = y_sum[11:0];

    // Output values: discard OUTPUT_SHIFT LSBs (12→10 bits by default)
    wire [9:0] x_out_next = x_filt_next[11:OUTPUT_SHIFT];
    wire [9:0] y_out_next = y_filt_next[11:OUTPUT_SHIFT];

    //══════════════════════════════════════════════════════════════════════
    // DIRECTION DETECTION LOGIC
    //══════════════════════════════════════════════════════════════════════

    // Delta from calibrated center (signed for direction)
    // Note: Y is inverted so "up" corresponds to positive delta
    wire signed [10:0] dx = {1'b0, x_out_next} - {1'b0, x_center};
    wire signed [10:0] dy = {1'b0, y_center} - {1'b0, y_out_next};  // Inverted!

    // Absolute values for threshold comparison and diagonal logic
    wire [10:0] abs_dx = dx[10] ? (~dx + 11'd1) : dx;
    wire [10:0] abs_dy = dy[10] ? (~dy + 11'd1) : dy;

    // Extended band width for comparison
    wire [10:0] recenter_band_ext = {1'b0, RECENTER_BAND};

    // Signed threshold constants for comparison
    wire signed [10:0] delta_on_pos  = {1'b0, DELTA_ON};
    wire signed [10:0] delta_off_pos = {1'b0, DELTA_OFF};
    wire signed [10:0] delta_on_neg  = -{1'b0, DELTA_ON};
    wire signed [10:0] delta_off_neg = -{1'b0, DELTA_OFF};

    //──────────────────────────────────────────────────────────────────────
    // HYSTERESIS STATE MACHINE (combinational)
    //──────────────────────────────────────────────────────────────────────
    // Each direction uses current state to select threshold:
    // - If currently OFF: use DELTA_ON to activate
    // - If currently ON:  use DELTA_OFF to deactivate

    wire left_raw  = left  ? (dx <  delta_off_neg) : (dx <= delta_on_neg);
    wire right_raw = right ? (dx >  delta_off_pos) : (dx >= delta_on_pos);
    wire down_raw  = down  ? (dy <  delta_off_neg) : (dy <= delta_on_neg);
    wire up_raw    = up    ? (dy >  delta_off_pos) : (dy >= delta_on_pos);

    //──────────────────────────────────────────────────────────────────────
    // DIAGONAL FILTERING
    //──────────────────────────────────────────────────────────────────────
    // When AXIS_MARGIN > 0, suppress minor cross-axis movements

    wire allow_h = (AXIS_MARGIN == 0) ? 1'b1 : (abs_dx + AXIS_MARGIN >= abs_dy);
    wire allow_v = (AXIS_MARGIN == 0) ? 1'b1 : (abs_dy + AXIS_MARGIN >= abs_dx);

    // Final direction values after diagonal filtering
    wire left_next  = left_raw  & allow_h;
    wire right_next = right_raw & allow_h;
    wire down_next  = down_raw  & allow_v;
    wire up_next    = up_raw    & allow_v;

    //══════════════════════════════════════════════════════════════════════
    // CALIBRATION ACCUMULATOR LOGIC
    //══════════════════════════════════════════════════════════════════════

    // Running sum for initial calibration
    wire [ACC_WIDTH-1:0] x_acc_sum = x_acc + x_out_next;
    wire [ACC_WIDTH-1:0] y_acc_sum = y_acc + y_out_next;

    //══════════════════════════════════════════════════════════════════════
    // RE-CENTERING LOGIC
    //══════════════════════════════════════════════════════════════════════

    // Running sum for re-centering
    wire [ACC_WIDTH-1:0] x_acc_rec_sum = x_acc_rec + x_out_next;
    wire [ACC_WIDTH-1:0] y_acc_rec_sum = y_acc_rec + y_out_next;

    // Step size (change between samples) for stability detection
    wire [9:0] x_step = (x_out_next > x_out) ? (x_out_next - x_out) : (x_out - x_out_next);
    wire [9:0] y_step = (y_out_next > y_out) ? (y_out_next - y_out) : (y_out - y_out_next);

    // Position is "stable" if change is below threshold
    wire stable_pos = (x_step <= STABLE_THRESH) && (y_step <= STABLE_THRESH);

    // Position is within re-centering window
    wire recenter_window = (abs_dx <= recenter_band_ext) && (abs_dy <= recenter_band_ext);

    //══════════════════════════════════════════════════════════════════════
    // MCLK EDGE DETECTION
    //══════════════════════════════════════════════════════════════════════

    // Synchronize mclk to system clock domain and detect rising edge
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mclk_r1 <= 1'b0;
            mclk_r2 <= 1'b0;
        end else begin
            mclk_r1 <= mclk;
            mclk_r2 <= mclk_r1;
        end
    end

    // Rising edge when r1=1 and r2=0 (one clock delay for metastability)
    assign mclk_posedge = mclk_r1 & ~mclk_r2;

    //══════════════════════════════════════════════════════════════════════
    // MAIN STATE MACHINE
    //══════════════════════════════════════════════════════════════════════
    // All processing happens on mclk rising edge (new ADC sample)

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            //──────────────────────────────────────────────────────────────
            // RESET: Initialize all registers to known state
            //──────────────────────────────────────────────────────────────

            // Filter state: start at nominal center
            x_filt      <= CENTER_12B;
            y_filt      <= CENTER_12B;
            x_out       <= CENTER_12B[11:OUTPUT_SHIFT];
            y_out       <= CENTER_12B[11:OUTPUT_SHIFT];

            // Directions: all off
            up          <= 1'b0;
            down        <= 1'b0;
            left        <= 1'b0;
            right       <= 1'b0;

            // Calibration: use nominal center until calibrated
            x_center    <= CENTER_12B[11:OUTPUT_SHIFT];
            y_center    <= CENTER_12B[11:OUTPUT_SHIFT];
            x_acc       <= {ACC_WIDTH{1'b0}};
            y_acc       <= {ACC_WIDTH{1'b0}};
            calib_count <= {CALIB_SHIFT+1{1'b0}};
            calib_done  <= 1'b0;

            // Re-centering: clear accumulators
            x_acc_rec   <= {ACC_WIDTH{1'b0}};
            y_acc_rec   <= {ACC_WIDTH{1'b0}};
            recenter_count <= {RECENTER_SHIFT+1{1'b0}};

        end else if (mclk_posedge) begin
            //──────────────────────────────────────────────────────────────
            // NEW SAMPLE: Update filter (always)
            //──────────────────────────────────────────────────────────────
            x_filt <= x_filt_next;
            y_filt <= y_filt_next;
            x_out  <= x_out_next;
            y_out  <= y_out_next;

            if (!calib_done) begin
                //──────────────────────────────────────────────────────────
                // CALIBRATION PHASE: Accumulate samples to find center
                //──────────────────────────────────────────────────────────

                if (calib_count == (1 << CALIB_SHIFT) - 1) begin
                    // Last calibration sample: compute average and finish
                    x_center    <= x_acc_sum >> CALIB_SHIFT;
                    y_center    <= y_acc_sum >> CALIB_SHIFT;
                    calib_done  <= 1'b1;
                    calib_count <= calib_count + 1'b1;  // Prevent re-entry
                    x_acc       <= {ACC_WIDTH{1'b0}};
                    y_acc       <= {ACC_WIDTH{1'b0}};

                    // Keep directions off during calibration
                    up          <= 1'b0;
                    down        <= 1'b0;
                    left        <= 1'b0;
                    right       <= 1'b0;
                end else begin
                    // Accumulate sample for averaging
                    x_acc       <= x_acc_sum;
                    y_acc       <= y_acc_sum;
                    calib_count <= calib_count + 1'b1;

                    // Keep directions off during calibration
                    up          <= 1'b0;
                    down        <= 1'b0;
                    left        <= 1'b0;
                    right       <= 1'b0;
                end

            end else begin
                //──────────────────────────────────────────────────────────
                // NORMAL OPERATION: Re-centering and direction detection
                //──────────────────────────────────────────────────────────

                // Re-centering: update center when joystick is at rest
                if (recenter_window && stable_pos) begin
                    // Joystick is within rest window and position is stable
                    if (recenter_count == (1 << RECENTER_SHIFT) - 1) begin
                        // Enough samples: update center to current average
                        x_center       <= x_acc_rec_sum >> RECENTER_SHIFT;
                        y_center       <= y_acc_rec_sum >> RECENTER_SHIFT;
                        x_acc_rec      <= {ACC_WIDTH{1'b0}};
                        y_acc_rec      <= {ACC_WIDTH{1'b0}};
                        recenter_count <= {RECENTER_SHIFT+1{1'b0}};
                    end else begin
                        // Accumulate sample for re-centering average
                        x_acc_rec      <= x_acc_rec_sum;
                        y_acc_rec      <= y_acc_rec_sum;
                        recenter_count <= recenter_count + 1'b1;
                    end
                end else begin
                    // Joystick moved or is unstable: reset re-centering
                    x_acc_rec      <= {ACC_WIDTH{1'b0}};
                    y_acc_rec      <= {ACC_WIDTH{1'b0}};
                    recenter_count <= {RECENTER_SHIFT+1{1'b0}};
                end

                // Update direction outputs (with hysteresis and diagonal filter)
                left  <= left_next;
                right <= right_next;
                down  <= down_next;
                up    <= up_next;
            end
        end
    end

endmodule
