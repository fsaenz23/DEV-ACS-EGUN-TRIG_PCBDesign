# DEV-ACS-EGUN-TRIG_PCBDesign

## Overview

This module is the printed-circuit-board design of the **Trigger Board Assembly** in the Reveam
Accelerator Control System (ACS): two stacked 1.6 mm boards, a 6-layer Base board and a 4-layer
Logic board, that accept a trigger, gate it with inhibit and mode logic, and drive the output
pulse while reporting isolated status. It holds the KiCad schematic and layout sources, the
released fabrication outputs, the bill of materials, and the system documentation. It is a design
artifact (`project_type: product`), identified independently of any facility it is later instanced
into. The released boards are in production; this repo records them as the baseline.

## Owner

Accountable owner: **Francisco Saenz** (party `pty-francisco-saenz`; EntraID `fjsaenz`; see
[`Workflows/ownership/parties.yaml`](../Workflows/ownership/parties.yaml) and the per-system
record in [`Workflows/ownership/stakeholders.yaml`](../Workflows/ownership/stakeholders.yaml)).
This project runs `workflow_mode: direct` (single-committer; commits land on the main branch).

## Scope

Scope is declared machine-readably in [`compatibility.yaml`](../compatibility.yaml) per
fw-T11.C1.S1.SS2 and in human prose in the repo-root [`README.md`](../README.md) per
fw-T11.C1.S1.SS1. In short: this repo governs the two-board trigger assembly design content only.
It excludes firmware or control code, facility-side instancing, the consumed governance bylaws,
the vendor fiber evaluation boards, the future all-SMD redesign, and sibling ACS boards.

## How to use

Operators run the `Workflows/*.ps1` lifecycle scripts (`validate` -> `push` -> `tag`; `pull` to
sync, `deliver` to cut a delivery baseline) rather than raw git (fw-T3.C1.S3). Design content
lives under `Definition/`: `Drawings/` (KiCad sources, `exports/` for PDFs and renders),
`Fabrication/` (Gerbers and the JLCPCB reorder kit), `Equipment/` (BOMs), `Architecture/` (block
diagram), `Calculations/` (Falstad simulation) and `Narratives/` (system documentation and design
notes). To reorder bare boards start at `Definition/Fabrication/README.md`. Agents read
[`AGENTS.md`](../AGENTS.md) first.

## Where to look next

See [`FUNCTIONAL.md`](FUNCTIONAL.md) for what the assembly does, [`INTERFACES.md`](INTERFACES.md)
for its provided / required interfaces (narrating [`interfaces.yaml`](../interfaces.yaml)), and
[`CHANGES.md`](CHANGES.md) for how the design has evolved. The append-only ledger is
[`change-log.md`](../change-log.md); resumable state is
[`Project/STANDING-STATE.md`](../Project/STANDING-STATE.md). The full pin-by-pin reference is
`Definition/Narratives/trigger-board-system-documentation.pdf`.
