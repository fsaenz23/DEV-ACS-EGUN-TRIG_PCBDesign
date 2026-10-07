# Logic board - fabrication order specification

Reorder with: Gerbers_Logicboard.zip (this folder). Same files as Logic_Board/Gerbers in the package.

| Item | Value |
| --- | --- |
| Board | Logic board rev 0.2 (KiCad project: Logic_Board/KiCad/logicboard.kicad_pcb) |
| Last order | JLCPCB, order 9354260A_Y8, accounted 2025-06-05. A replacement-file order for an earlier order (Y7) that was missing the drill layer. Package: JLCPCB_Order_9354260A_Y8.zip |
| Layers | 4 (F.Cu, In1, In2, B.Cu) |
| Size | 150.0 x 39.0 mm (from Edge_Cuts; matches the fab job file) |
| Thickness | 1.6 mm, FR-4 |
| Copper | 1 oz outer, 0.5 oz inner |
| Solder mask | Green |
| Silkscreen | White |
| Surface finish | HASL with lead (leaded) |
| Vias | Plugged with soldermask ("oil") |
| Min drill | 0.30 mm (16 vias); other holes 0.8 and 1.0 mm |
| Narrowest track | 0.50 mm |
| Design software | KiCad 8.0.8 |
| Gerber set | 15 files: 4 copper, mask/paste/silk top and bottom, edge cuts, PTH and NPTH drill + drill maps. Must include the drill files. |

Notes: the first Gerber zip without drill files (Archive/Superseded_Fabrication) must NOT be used for ordering. Finish differs from the base board; this is intentional: keep leaded HASL on the logic board and reorder with the same finish.
Source: fab job file 4te.json inside the JLCPCB package (Chinese-encoded; translated here).
