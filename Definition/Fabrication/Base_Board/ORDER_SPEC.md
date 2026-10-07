# Base board - fabrication order specification

Reorder with: Gerbers_Baseboard-PinVersion.zip (this folder). Same files as Base_Board/Gerbers in the package.

| Item | Value |
| --- | --- |
| Board | Base board, "pin version" (KiCad project: Base_Board/KiCad/baseboard.kicad_pcb) |
| Last order | JLCPCB, order 9354260A_Y6, accounted 2025-05-30 (package: JLCPCB_Order_9354260A_Y6.zip) |
| Layers | 6 (F.Cu, In1-In4, B.Cu) |
| Size | 157.7 x 86.4 mm (from Edge_Cuts; matches the fab job file) |
| Thickness | 1.6 mm, FR-4 |
| Copper | 1 oz outer, 0.5 oz inner |
| Solder mask | Green |
| Silkscreen | White |
| Surface finish | ENIG (immersion gold) |
| Vias | Plugged with resin |
| Min drill | 0.30 mm (37 vias); through-hole sizes 0.6 to 1.524 mm |
| Narrowest track | 0.45 mm |
| Design software | KiCad 8.0.8 |
| Gerber set | 17 files: 6 copper, mask/paste/silk top and bottom, edge cuts, PTH and NPTH drill + drill maps |

Notes: finish differs from the logic board (see its spec); this is intentional: keep ENIG on the base board and reorder with the same finish. The board carries two fiber headers (J7, J10) for modified fiber evaluation boards that are NOT part of this order.
Source: fab job file 4te.json inside the JLCPCB package (Chinese-encoded; translated here).
