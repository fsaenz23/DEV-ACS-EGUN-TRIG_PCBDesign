# AGENTS.md -- entry point for AI agents

**If you are an AI agent (Claude, GPT, or other) that has just landed in this repo, read this file first.** It identifies the repo, then routes you to the rules you operate under. It is a pointer surface (fw-T7.C1.S1.SS3, authored per fw-T8.C1.S4.SS8): stable identity is stated literally; everything that can move between releases is reached by pointer, so this file does not rot.

## Identity header (fw-T7.C1.S1.SS3)

- **project_id:** `DEV-ACS-EGUN-TRIG_PCBDesign`
- **project_type:** `product` -- the valid value set is owned by fw-T1.C1.S2.SS1; do not learn the enum from any file but that one. If this line reads `TBD`, set it from the charter (`00-project-meta/project-charter.md`) during Phase 2.
- **role signal:** you are reading this file at a repo **root**, so you are this repo's **maintainer** (fw-T7.C1.S1.SS2). If you are reading a copy nested under another project's `Governance/` or `modules/`, you are a **consumer** of it: read-only, edit-upstream-and-bump. Which modules YOU may edit: read `.gitmodules` (fw-T11.C1.S9) -- every pinned submodule is consumer/read-only.
- **current version:** read the `VERSION` file (equals the latest tag; release history in `change-log.md`)
- **in-flight state:** read `Project/STANDING-STATE.md` (fw-T7.C1.S18.SS1) -- what is mid-build, last/next step, open threads

## Operating contract -- always-on rules (read before doing anything)

These bind every response and every change, regardless of task. Each is a pointer to the canonical rule (read the cited Section for detail; this block cites, it does not restate, per fw-T11.C1.S2). Do NOT treat the bootstrap reading list as your only obligations -- these always apply:

- **Use the scripts, not raw git** -- commit/push/pull/validate go through `Workflows/*.ps1` (-> the pinned FW canonical scripts), not hand-rolled git (fw-T3.C1.S3 + fw-T7.C1.S13).
- **Commit-message format** -- `<type>: <=70-char imperative subject>` + `Refs:` trailers (fw-T3.C1.S2). The local `commit-msg` hook enforces it.
- **Branch vs direct** -- follow `compatibility.yaml`'s `workflow_mode`: `direct` = commit to `main`; `branched-pr` = feature branch + PR (fw-T3.C1.S1).
- **End every response with a `Next Steps:` block** (fw-T7.C1.S14.SS7).
- **One logical operation per command block**, each opening with `cd "<repo-root>"`, every path/argument fully resolved -- never a placeholder the operator must fill in (fw-T7.C1.S10).
- **Cite rule-IDs before acting; if two rules conflict, stop and ask** (fw-T7.C1.S2 + fw-T7.C1.S3).
- **Free creation only in `_sandbox/`** -- never invent folders in canonical paths (fw-T7.C1.S5).
- **Every module gets a UNIQUE asset_id** -- never put two modules at one group/categorical node; if the catalog has no leaf code, mint and document a local supplemental (`<parent>-NN-<Slug>` in `Governance/Local/CodedStructures/local-substructure.yaml`), do NOT invent a canonical dotted code (cs-T5.C1.S2.SS2 + cs-T5.C1.S12).
- **Verify, don't assume** -- read a script's captured log before reporting it succeeded; "done" means "I ran it," not "it worked" (fw-T7.C1.S14.SS2).

A one-screen index of the rules you'll most need is the **Quick-Reference Card**: `Governance/_GOV-DesignFramework/Definition/References/guides/agent-quick-reference-card.md`.

This project was scaffolded by `new-project.ps1` (per fw-T3.C1.S7). Phase 1 emitted this AGENTS.md + a BOOTSTRAP.md + minimal compatibility.yaml + the FW + CS governance submodules at their pinned versions. Phase 2 (you, now) reads canonical bylaws from the just-checked-out submodules + populates the substantive scaffold files (interfaces.yaml + composition.yaml + docs/{README, FUNCTIONAL, INTERFACES, CHANGES}.md) with project-aware content.

## Step 1 -- read BOOTSTRAP.md first

`BOOTSTRAP.md` at this repo root contains the numbered Phase-2 next-steps. Read it carefully; it cites the canonical bylaws Sections you'll need to read (cs-T5 asset_id grammar; cs-T8 project taxonomy; fw-T4.C1.S6 naming; fw-T11.C1.S1 scope; fw-T9.C1.S5 interfaces; fw-T8.C1.S9 doc-set).

## Step 2 -- read canonical bylaws from the submodules

Per fw-T3.C1.S7.SS4 (references-not-excerpts discipline), BOOTSTRAP.md cites bylaws Sections by ID + file path. Read the actual canonical Section content from the just-checked-out FW + CS submodules. Do NOT rely on excerpts; canonical Sections may have evolved between script-author time and your Phase-2 read.

## Step 3 -- identify yourself and your user

Per fw-T7.C1.S1 (Session Start Reading), acknowledge:

- The user's EntraID (e.g., `ahuber`). Use this as the `by:` field on every change-log entry you author.
- This is a NEW PROJECT in Phase 2 state. The compatibility.yaml has placeholder fields (workflow_mode is set; scope-block + project-type type_ref need population).

## Step 4 -- elicit project metadata + populate scaffold

Phase 2 numbered steps (from BOOTSTRAP.md):

1. Read canonical bylaws (Step 2 above).
2. Elicit project type from cs-T8 (ACS / ECP / SCADA / MHS / QESH / BOS / IT).
3. Elicit asset_id components per cs-T5: location, function, type-class, discipline, ISO 81346 aspects.
4. Construct asset_id + proposed folder name; cite cs-T5 clauses; iterate with operator.
5. Populate compatibility.yaml with full data.
6. Author interfaces.yaml per fw-T9.C1.S5.
7. Author composition.yaml if multi-module per fw-T9.C1.S5.
8. Author docs/{README, FUNCTIONAL, INTERFACES, CHANGES}.md per fw-T8.C1.S9 (project-aware content; NOT stubs).
9. Run validate.ps1 from FW submodule; iterate until clean.
10. Commit + push per the three-option workflow in fw-T3.C1.S7.SS3 step 12.

## Step 5 -- cite rules before acting (fw-T7.C1.S2)

When proposing structure, naming, or any decision, cite the relevant rule ID (fw-T<n>.C<m>.S<k> or cs-T<n>.C<m>.S<k>). If two rules conflict, stop and flag per fw-T7.C1.S3.

---

<!-- AGENTS.md.template-fragment-fw.md (start) -->

## FW-specific notes

FW publishes the canonical bylaws + scripts + schemas. Read FW Sections from `Governance/_GOV-DesignFramework/Definition/Narratives/`. Cite as `fw-T<n>.C<m>.S<k>` for cross-module reference (per fw-T11.C1.S4); bare `T<n>.C<m>.S<k>` is reserved for FW's own self-references.

The canonical scripts at `Governance/_GOV-DesignFramework/Definition/References/scripts/` are the supported tooling. Prefer scripts over hand-rolled git commands per fw-T7.C1.S13 (Agent Workflow Automation Discipline).

<!-- AGENTS.md.template-fragment-fw.md (end) -->

<!-- AGENTS.md.template-fragment-cs.md (start; landed at cs-v0.9.0 cumulative adoption) -->

## CS-side bylaws to read for cataloging questions

When proposing asset_ids, project codes, or catalog citations, ALWAYS read the relevant cs-T<n>.C<m>.S<k> Section FRESH from the submodule before proposing. Specifically:

- `cs-T5.C1.S1-S11` -- asset_id grammar (base + supplemental + iso_81346_aspect)
- `cs-T8.C1.S1` -- DEV- code namespace (project taxonomy: ACS / ECP / SCADA / MHS / QESH / BOS / IT)
- `cs-T1` / `cs-T2` / `cs-T3` / `cs-T4` -- catalog tables (location / function / type-class / discipline)

Cite the rule before proposing per fw-T7.C1.S2. If two rules conflict, stop and flag per fw-T7.C1.S3.

<!-- AGENTS.md.template-fragment-cs.md (end) -->

---

When BOOTSTRAP.md's numbered steps are complete + validate.ps1 passes + commit/push lands, Phase 2 is done.

