# DEV-ACS-EGUN-TRIG_PCBDesign -- Interfaces

This narrates [`interfaces.yaml`](../interfaces.yaml) (fw-T9.C1.S5) for human readers. Each
subsection is keyed by the interface `id`. All interfaces are `lifecycle: active`: the boards are
released and in production. The board-to-board connectors (Base J8 to Logic J1, Base J2 to Logic
J2) are internal to the assembly and are documented in the system documentation, section 2.

## Provided interfaces

- **`trigger-output-bnc`** (`electrical`) -- the gated trigger pulse on BNC J5, driven by IC1
  (IXDN614PI), with an optional 50 ohm load (JP4). Selected with JP1. Change-sensitive on the
  connector, drive level and pulse width.
- **`trigger-output-fiber`** (`optical`) -- the same pulse on 3-pin header J7 (signal, GND, 5 V),
  feeding a fiber transmitter evaluation board. Selected with JP1.
- **`status-outputs`** (`electrical`) -- opto-isolated feedback on terminal block J3: remote,
  local, armed, one-shot, normal, power, trigger and inhibit-summary states plus per-inhibit
  status, powered from the external 24 V.

## Required interfaces

- **`trigger-input-bnc`** (`electrical`) -- external trigger on BNC J6, with optional 50 ohm
  termination (JP3). Selected with JP2.
- **`trigger-input-fiber`** (`optical`) -- external trigger from a fiber receiver evaluation board
  on 3-pin header J10 (signal, GND, 5 V). Selected with JP2.
- **`dc-power-in`** (`electrical`) -- 24 V and ground on J1 pins 1-2; each board's WPME-FDSM
  converter derives 5 V.
- **`isolated-24v-in`** (`electrical`) -- separate external 24 V and return (EXT_24V / EXT_GND) on
  J1 for the isolated I/O side.
- **`inhibit-inputs`** (`electrical`) -- three opto-isolated inhibit inputs on J1; any asserted
  inhibit stops output pulses.
- **`remote-control-inputs`** (`electrical`) -- external one-shot select and arm inputs on J1.

## Bidirectional interfaces

- (none) -- the assembly has no peer-bidirectional interfaces.

## Change-sensitive surfaces

The union of change-sensitive fields: `connector_type`, `logic_level`, `termination`
(trigger-input-bnc); `header_pinout`, `fiber_receiver_module` (trigger-input-fiber);
`connector_type`, `drive_level`, `pulse_width` (trigger-output-bnc); `header_pinout`,
`fiber_transmitter_module` (trigger-output-fiber); `rail_voltage`, `current_budget`,
`terminal_pinout` (dc-power-in); `rail_voltage`, `terminal_pinout` (isolated-24v-in);
`input_polarity`, `isolation`, `terminal_pinout` (inhibit-inputs, remote-control-inputs);
`signal_set`, `isolation`, `terminal_pinout` (status-outputs). A change to any of these alters
what connected equipment must expect -- notify the owners of the connected trigger source,
interlock and monitoring equipment before revising them, and co-change this narrative in the same
commit (fw-T9.C1.S5.SS8).

## Superseded interfaces

- (none)
