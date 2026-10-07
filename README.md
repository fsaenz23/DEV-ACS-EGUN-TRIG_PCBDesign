# <Project name>

> **Phase-1 scaffold.** This repo was just initialized by the CS-hosted scaffolder. To finish setup, an agent
> reads `AGENTS.md`, then `BOOTSTRAP.md`, and completes Phase 2 (name, classify, populate, validate, publish).
> Replace the `<Phase 2: ...>` placeholders below as the project takes shape. This README is the repo's
> human/operator **front door** (fw-T4.C1.S1.SS4): it orients + routes, and links to deeper resources rather
> than restating them.

## What this is

<Phase 2: one plain-language paragraph -- what this module is, who it is for, and why it exists.>

Structural role: `<governance module | asset-bearing Project | repo-module>`; `project_type`: `<type>`.
(A governance module also states what it governs and that consumers pin/consume it -- fw-T11.C1.S9.)

## Status

- **Status:** Phase-1 scaffold (pre-release) -- advances to `pilot` / `released` as the project matures.
- **Owner:** `<Phase 2: owner + EntraID>`.
- **Version:** see [`VERSION`](VERSION) (this repo's own rev). The full multi-module composition cover is the
  document meta-frontpage's job (fw-T8.C1.S11.SS8); this README states this repo's rev and links onward.

## Where things are (routing map)

- [`AGENTS.md`](AGENTS.md) -- **agents start here** (the operating contract + session-start reading order, fw-T7.C1.S1).
- [`BOOTSTRAP.md`](BOOTSTRAP.md) -- the Phase-2 setup steps for this freshly scaffolded repo.
- [`Definition/`](Definition/) -- the public content this repo offers (a governance module's bylaws under `Narratives/`; an asset-bearing repo's design content).
- [`Workflows/`](Workflows/) -- the canonical lifecycle scripts (`validate` / `push` / `pull` / `tag` / `deliver`); how to run them: fw-T3.C1.S3 / fw-T3.C1.S9.
- [`Project/STANDING-STATE.md`](Project/STANDING-STATE.md) -- standing state for resuming work (plus optional `Project/dev-tasks/`, fw-T7.C1.S18 / fw-T4.C1.S17).
- [`change-log.md`](change-log.md) + [`minutes/`](minutes/) -- the history of what shipped and why.
- `docs/` -- human documentation (authored in Phase 2).
- [`Governance/`](Governance/) -- how this repo is governed (the consumed governance submodules + any local governance).

## How to use it

- **Operators:** run the `Workflows/` scripts in order -- `validate.ps1` -> `push.ps1` -> `tag.ps1` (`pull.ps1` to sync, `deliver.ps1` to cut a delivery baseline). Details: fw-T3.C1.S3.
- **Agents:** read `AGENTS.md` first (it routes you to the bylaws + guides), then `BOOTSTRAP.md` for Phase 2.

---

*Map, not manual (fw-T4.C1.S1.SS4): this README points to `AGENTS.md`, the bylaws, and the scripts -- it does not restate them (single-source, fw-T11.C1.S2). Keep it current at release (status + version); the routing map is mostly static. `README.md` (humans) and `AGENTS.md` (agents) are the two parallel front doors.*
