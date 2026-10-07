# DEV-ACS-EGUN-TRIG_PCBDesign

> The human/operator **front door** (fw-T4.C1.S1.SS4): it orients + routes, and links to deeper resources
> rather than restating them. Agents start at [`AGENTS.md`](AGENTS.md).

## What this is

This repository holds the **printed-circuit-board design of the Trigger Board Assembly** in the Reveam
Accelerator Control System (ACS): a 6-layer Base board and a 4-layer Logic board that plug together and
gate and drive a trigger pulse with isolated status feedback. It is for the engineers who maintain,
review, reorder, or later redesign the boards. It carries the KiCad sources, released Gerbers and reorder
kit, bills of materials, and system documentation, identified independently of any facility the assembly
is later instanced into.

Structural role: `asset-bearing Project`; `project_type`: `product`. asset_id / project_id:
`DEV-ACS-EGUN-TRIG_PCBDesign` (ACS -> EGUN -> TRIG, project-type token `PCBDesign`; cs-T5.C1.S3 /
cs-T5.C1.S17.SS1).

## Scope (fw-T11.C1.S1.SS1)

- **Subject:** the two-board Trigger Board Assembly PCB design (schematics, layouts, BOM, released
  fabrication outputs, system documentation).
- **Axis:** the asset itself -- the PCB design content.
- **Excludes:** firmware or control code (none exists; discrete logic); facility-side instancing
  (E-coded facility repos via `type_ref`); the governance bylaws (FW + CS, consumed as pinned
  submodules); the vendor fiber evaluation boards plugged into J7/J10; the planned all-SMD redesign
  (future, will branch from this baseline); and sibling ACS boards.

This human-prose Scope MUST agree with the machine-readable `scope:` block in
[`compatibility.yaml`](compatibility.yaml) (fw-T11.C1.S1.SS2).

## Status

- **Status:** Phase-2 bootstrap complete (pre-release, `v0.1.0`); the boards themselves are released and in production.
- **Owner:** Francisco Saenz (party `pty-francisco-saenz`; EntraID `fjsaenz`). See [`Workflows/ownership/parties.yaml`](Workflows/ownership/parties.yaml).
- **Version:** see [`VERSION`](VERSION) (this repo's own rev). The full multi-module composition cover is the
  document meta-frontpage's job (fw-T8.C1.S11.SS8); this README states this repo's rev and links onward.

## Where things are (routing map)

- [`AGENTS.md`](AGENTS.md) -- **agents start here** (the operating contract + session-start reading order, fw-T7.C1.S1).
- [`BOOTSTRAP.md`](BOOTSTRAP.md) -- the Phase-2 setup steps this repo was scaffolded with.
- [`Definition/`](Definition/) -- the design content: `Drawings/` (KiCad sources + exports), `Fabrication/` (Gerbers, reorder kit), `Equipment/` (BOMs), `Architecture/`, `Calculations/`, `Narratives/`.
- [`Workflows/`](Workflows/) -- the canonical lifecycle scripts (`validate` / `push` / `pull` / `tag` / `deliver`); how to run them: fw-T3.C1.S3 / fw-T3.C1.S9.
- [`Project/STANDING-STATE.md`](Project/STANDING-STATE.md) -- standing state for resuming work (plus optional `Project/dev-tasks/`, fw-T7.C1.S18 / fw-T4.C1.S17).
- [`change-log.md`](change-log.md) + [`minutes/`](minutes/) -- the history of what shipped and why.
- [`docs/`](docs/) -- human documentation (README / FUNCTIONAL / INTERFACES / CHANGES).
- [`Governance/`](Governance/) -- how this repo is governed (the consumed governance submodules + any local governance).

## How to use it

- **Operators:** run the `Workflows/` scripts in order -- `validate.ps1` -> `push.ps1` -> `tag.ps1` (`pull.ps1` to sync, `deliver.ps1` to cut a delivery baseline). Details: fw-T3.C1.S3.
- **Agents:** read `AGENTS.md` first (it routes you to the bylaws + guides).
- **Reordering boards:** start at [`Definition/Fabrication/README.md`](Definition/Fabrication/README.md).

---

*Map, not manual (fw-T4.C1.S1.SS4): this README points to `AGENTS.md`, the bylaws, and the scripts -- it does not restate them (single-source, fw-T11.C1.S2). Keep it current at release (status + version); the routing map is mostly static. `README.md` (humans) and `AGENTS.md` (agents) are the two parallel front doors.*
