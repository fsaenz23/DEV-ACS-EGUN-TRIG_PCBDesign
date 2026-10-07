---
current_version: dev-acs-egun-trig-pcbdesign-v0.1.0
---

# Standing State

> Per fw-T7.C1.S18.SS1 -- the MANDATORY agent-resume record (Session Continuity & Roadmap Maintenance).
> A new or replacement agent reads this FIRST to resume (SS1), and keeps it current as work proceeds and
> before handing off (SS2). Pairs with the OPTIONAL dev-tracking surface (Project/dev-tasks/, fw-T4.C1.S17,
> if enabled) and the latest change-log / minutes.

## Operator-engagement block (FW-canonical default; re-surfaced per fw-T7.C1.S18.SS3)

Per fw-T7.C1.S18.SS3, paste this block verbatim at the top of every resume / handoff / continuation
prompt so a fresh agent is reminded how the operator wants to be engaged. The block CONTENT is
single-sourced from FW's pinned operator-engagement-block.md (fw-T11.C1.S2) and inlined below at
scaffold time; this project MAY override or extend its own copy, but the re-surfacing obligation
itself is not overridable.

> FALLBACK POINTER (pinned FW operator-engagement-block.md absent at emit time -- NOT the canonical text).
> Read the canonical block from the pinned submodule at
> Governance/_GOV-DesignFramework/Definition/References/templates/operator-engagement-block.md and paste
> it here verbatim. Per fw-T7.C1.S18.SS3 this block is re-surfaced at every resume / handoff; per
> fw-T11.C1.S2 its content is single-sourced from the FW artifact, never hardcoded in a consumer.

## Current standing state
- Phase: Phase 2 content populated 2026-10-07 (uncommitted); name gate CANONICAL, validate.ps1 PASS
- Classification: DEV-ACS-EGUN-TRIG_PCBDesign (ACS -> EGUN -> TRIG; function TimingSignal; type-class PCB; discipline D040)
- Owner: pty-francisco-saenz (EntraID fsaenz)
- Layout: flat (no eigen-module; no composition.yaml); two boards under Definition/Drawings/{Base_Board,Logic_Board}
- Design content: released Base ("pin version") + Logic (rev 0.2) boards; source package C:\Repos\Trigger_Board_Package left untouched
- Pins: see compatibility.yaml (governance_pins)
- Last shipped: none yet

## Next steps
- [x] Name gate: CANONICAL (advisory only: PCBDesign not in catalogued project-type set).
- [x] Workflows/validate.ps1: PASS, 0 errors.
- [ ] Commit + push via Workflows/push.ps1 (choose remote); tag via Workflows/tag.ps1.

## Open decisions / parked
- Two ORDER_SPEC.md files fail Definition/Fabrication/CHECKSUMS.sha256 (edited after checksums); regenerate if wanted.
- Functional descriptions in the system documentation (section 1) still to be confirmed against design intent.
- Optional full Gerber check (silkscreen, paste, pad shapes) not done.
