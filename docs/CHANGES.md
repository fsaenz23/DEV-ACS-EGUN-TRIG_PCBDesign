# DEV-ACS-EGUN-TRIG_PCBDesign -- Changes

This is the curated, human-readable change narrative. The append-only per-commit ledger is
[`change-log.md`](../change-log.md) (fw-T8.C1.S1); this file (fw-T8.C1.S9.SS2) summarizes the
changes that matter for a reader catching up on the design.

## Recent

**Released Trigger Board design landed (v0.1.0).** The released Base board ("pin version",
6-layer) and Logic board (rev 0.2, 4-layer) KiCad projects, their released Gerbers and JLCPCB
reorder kit (orders 9354260A_Y6 and _Y8), the corrected master BOM, the Falstad simulation, the
block diagram, and the system documentation were placed under `Definition/` (Drawings,
Fabrication, Equipment, Calculations, Architecture, Narratives). Source files keep their
tool-given names per fw-T4.C1.S6.SS5. See [`change-log.md`](../change-log.md) for the commit.

**Phase 2 bootstrap (v0.1.0).** The repository was scaffolded in Phase 1 and completed through
Phase 2 per `BOOTSTRAP.md`: classified as ACS -> EGUN -> TRIG (function `TimingSignal`; discipline
D040 Electrical), scope and ownership populated, interface manifest authored, doc-set created.

## Notable historical

Nothing yet -- v0.1.0 records the released boards as the baseline. Planned future work (not
started): an all-SMD redesign for fab assembly, removing the fiber evaluation boards in favor of
on-board optics, and possibly merging the two boards. It will branch from this baseline and be
narrated here when it begins.
