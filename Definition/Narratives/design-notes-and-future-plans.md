# Design notes and future plans

This released version is the baseline. The all-SMD version will branch from it.

Recorded 2026-10-07 from the designer (Francisco). The released boards are in production and stay as they are.

## As-built decisions
- The fiber link uses modified fiber evaluation boards, not on-board optics. They plug into the base board headers J7 (output) and J10 (input). They were chosen because they were what Mouser/DigiKey had in stock.
- The evaluation board is AFBR-0548Z (Mouser 630-AFBR-0548Z), one board listed for J7 and J10 in Final_Trigger_Board_BOM.xlsx. Modification: the bent (right-angle) interface pins were removed and replaced with straight pins pointing vertically down, with the longer part of each pin on the side opposite the fiber ports, so the board plugs into the base board headers J7 and J10. The replacement pins are generic 3-position, 2.54 mm pitch header (no part number), cut from a longer strip on hand.
- C12 (100 uF 25 V) is a regular electrolytic capacitor from an Amazon capacitor kit (no part number; D 5.18 mm, H 11.37 mm, lead pitch 1.77 mm as bent), with its leads bent so the top PCB does not hit it. The original Final BOM MPN did not match and was replaced with "kit part".
- Logic R1 (10 k, 1%) is a resistor from a resistor kit (bands brown-black-black-red-brown), no part number. The original Final BOM MPN did not match and was replaced with "kit part".
- Final testing (Final Testing sheet of the BOM): two assemblies passed all 22 tests, including BNC and fiber input/output.
- Surface finish was ordered differently per board (base: ENIG with resin-plugged vias; logic: leaded HASL with oil-plugged vias). Keep as ordered for now. This likely explains why the two boards look different (gold vs silver pads), but that has not been confirmed with the fab.
- Orders: base 9354260A_Y6, logic 9354260A_Y8 (JLCPCB). Ordered files match the files in Base_Board/Gerbers and Logic_Board/Gerbers.

## Future plans (not started)
1. Redesign with all-SMD parts so the boards can be assembled with parts placed by the fab (SMT assembly), replacing the through-hole ICs, networks and connectors where possible.
2. Remove the fiber evaluation boards and put the fiber transmitter/receiver on the board itself. The supporting passives for those parts are only needed at that point.
3. With SMD parts, consider merging the base and logic boards into one board sized to fit the Phoenix enclosure used for this assembly.
