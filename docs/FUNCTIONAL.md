# DEV-ACS-EGUN-TRIG_PCBDesign -- Functional Description

## Purpose

The assembly receives an external trigger, decides whether it may pass, and drives the resulting
output pulse, while reporting its state through isolated status outputs. It supports normal
(continuous) and one-shot operation, local and remote mode selection, and three independent
external inhibit inputs. Functional behavior below is derived from the schematic netlist and
should be read against design intent (see the system documentation, section 1).

## Inputs

The assembly consumes a trigger on BNC J6 or fiber header J10 (selected by JP2, with an optional
50 ohm termination on JP3), 24 V DC power on terminal block J1, a separate external 24 V for the
isolated I/O, three opto-isolated inhibit inputs, external one-shot select and arm inputs, and
local operator controls (mode switches SW2/SW3 and the one-shot push button SW1). These
correspond to the `required` interfaces in [`interfaces.yaml`](../interfaces.yaml).

## Outputs

The assembly produces the gated trigger pulse, driven by IC1 (IXDN614PI) onto BNC J5 or fiber
header J7 (selected by JP1, with an optional 50 ohm load on JP4), and opto-isolated status
feedback on terminal block J3 (remote, local, armed, one-shot, normal, power, trigger and
inhibit-summary states). These correspond to the `provided` interfaces in
[`interfaces.yaml`](../interfaces.yaml).

## Operating modes

Local and remote selection (SW2) and normal versus one-shot operation (SW3, with the SW1 push
button or the external arm / one-shot inputs) set the mode; the Logic board state logic produces
the armed, one-shot, normal and local / remote status. In any mode, an asserted inhibit (inputs
1 to 3, summed in the Base board logic) stops output pulses. Timing is set by monostables U4
(74LS221) and U9 (74AHCT123) with the component values listed in the system documentation.
Final testing recorded 22 tests passed on two assemblies, covering BNC and fiber input and
output, inhibits 1 to 3, the one-shot button, mode switches and the termination jumpers.

## Dependencies

The assembly depends on a 24 V supply for the Base board (the Logic board is fed through board
connector J2) and on an external 24 V for the isolated status and input side. The fiber paths
depend on modified AFBR-0548Z evaluation boards plugged into J7 and J10, which are sourced
separately. Upstream and downstream consumers of the trigger, inhibit and status signals are
facility-side and are bound at instancing. It consumes the pinned FW + CS governance submodules
for structure and lifecycle tooling; it authors none of that governance itself.
