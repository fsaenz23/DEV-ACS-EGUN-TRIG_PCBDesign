# Change Log

Append-only per-commit ledger (fw-T8.C1.S1). Newest entries at the top.

## 2026-10-07 -- fix: correct owner EntraID to fsaenz

- **by:** fsaenz
- **commit:** *(pending)*
- **branch:** master
- **scope:** project
- **rules cited:** fw-T2.C1.S10.SS1, fw-T8.C1.S1.SS1

Corrected the owner's EntraID from the inferred `fjsaenz` to `fsaenz` in
`Workflows/ownership/parties.yaml`, `README.md`, `docs/README.md` and
`Project/STANDING-STATE.md`. The two earlier entries below carry `by: fjsaenz`; the ledger is
append-only, so they are left as written and this entry supersedes them.

## 2026-10-07 -- fix: set owner email to work address

- **by:** fjsaenz
- **commit:** *(pending)*
- **branch:** master
- **scope:** project
- **rules cited:** fw-T2.C1.S10.SS1, fw-T8.C1.S1.SS1

Changed the owner party's email in `Workflows/ownership/parties.yaml` from the personal address to
the work address (`fsaenz@reveam.com`). No other content change.

## 2026-10-07 -- dev-acs-egun-trig-pcbdesign-v0.1.0 MINOR none: Phase-2 bootstrap + released Trigger Board design content

- **by:** fjsaenz
- **commit:** *(pending first commit)*
- **branch:** main
- **scope:** project
- **rules cited:** cs-T5.C1.S3, cs-T5.C1.S17, fw-T4.C1.S2, fw-T4.C1.S6.SS5, fw-T11.C1.S1, fw-T9.C1.S5, fw-T8.C1.S9, fw-T2.C1.S10, fw-T6.C1.S4

Completed the Phase-2 bootstrap. Classified the project: category **ACS** -> **EGUN** -> **TRIG**,
project-type token **PCBDesign**, giving `DEV-ACS-EGUN-TRIG_PCBDesign` (operator-elected name;
`TRIG` is an operator-chosen segment under `EGUN`; the CS name gate reports CANONICAL, with an advisory
that `PCBDesign` is outside the catalogued project-type set, accepted structurally as in the sibling
DDS repo); function `TimingSignal` (cs-T2), type-class `PCB`,
discipline **D040 Electrical**; flat layout (no eigen-module, no `composition.yaml`).

Populated `compatibility.yaml` (scope), `interfaces.yaml` (nine active interfaces), the four-file
`docs/` suite, `README.md`, and the ownership registries (owner `pty-francisco-saenz`). Placed the
released design content from the Trigger Board package: KiCad projects in `Definition/Drawings/`
(PDF plots and renders in `Drawings/exports/`), the reorder kit and unzipped Gerbers in
`Definition/Fabrication/`, BOMs in `Definition/Equipment/`, block diagram in
`Definition/Architecture/`, Falstad simulation in `Definition/Calculations/`, and the system
documentation and design notes in `Definition/Narratives/` (renamed lowercase-hyphen). Source
files were not renamed. Extended `access.yaml` (swap-only for binary content) and `.gitattributes`
(binary rules for Gerbers, drills and exports so checksums hold). Known: two `ORDER_SPEC.md`
files fail `Definition/Fabrication/CHECKSUMS.sha256` (edited after the checksums were made).
