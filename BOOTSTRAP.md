# Project Bootstrap

You are an AI agent loaded into this new project's folder. The operator has run `new-project.ps1` to scaffold this directory (Phase 1); your job is to complete the bootstrap by reading canonical bylaws from the just-checked-out submodules and populating the project files per those bylaws (Phase 2).

Per cs-T5.C1.S17.SS3 (references-not-excerpts): this document contains REFERENCES to canonical bylaws Sections, NOT excerpts. Read the canonical content FRESH from the submodule paths cited below.

## What's already done (Phase 1)

- Directory created; git initialized; longpaths=true.
- `.gitignore` + `.gitattributes` emitted (canonical Windows defaults; ASCII working-tree-encoding for .ps1).
- `README.md` emitted: the human/operator **front door** per fw-T4.C1.S1.SS4 (parallel to `AGENTS.md`; orients + routes, links-not-restates). In Phase 2, fill the `<Phase 2: ...>` placeholders (project name/purpose/owner) and set status as the project matures. Keep it a map, not a manual.
- `AGENTS.md` emitted (templated from fw-T3.C1.S7.SS4; includes CS-aware fragment). `README.md` + `AGENTS.md` are the two parallel front doors (humans / agents).
- This file (`BOOTSTRAP.md`) emitted.
- `compatibility.yaml` minimal stub emitted (workflow_mode=direct + governance-pins resolved + scope-block placeholder).
- `VERSION` emitted = `<project_id-lower>-v0.1.0`: the version-tag prefix is your lowercased `project_id` (non-alphanumerics folded to `-`), unique by construction so sibling repos at the same facility never collide (cs-T5.C1.S17.SS8). Bump only `<X.Y.Z>` from here and keep the prefix; `governance.module` is a commit-scope label, not the version identity.
- `Project/STANDING-STATE.md` emitted: a born-resumable standing-state per fw-T7.C1.S18.SS1 (homed under the top-level `Project/`, the project-management/continuity surface; `Governance/` is authority-only -- fw-v0.42.0). Keep it current as you work and before ending a session (it is how the next agent resumes).
- `docs/audits/.gitkeep` emitted (day-0 audit retention folder per fw-T8.C1.S9.SS4).
- `Workflows/ci/*.yml` emitted: five **thin CI manifests** (`docs-audit`, `party-resolvability`, `access-manifest-check`, `narrative-reachability`, `yaml-schema-validation`) that **delegate to the FW-pinned canonical validators** in the `_GOV-DesignFramework` submodule (FW owns the validator bodies; CS emits the manifests -- boundary ratified 2026-06-16). `validate.ps1` discovers + runs them automatically, so the repo is **born with CI active**. Do NOT author validator bodies here. (`yaml-schema-validation` uses `metadata_mode: warn` so the schema-less Phase-1 stubs do not ERROR; YAMLs that declare a schema are validated for real. Tighten to `error` in Phase 2 once every companion YAML carries a schema block.)
- `Governance/Registry/yaml-schemas.local.yaml` emitted: the repo-local schema-registry **stub** (`schemas: []`) per fw-T3.C1.S6.SS8. Fill `governance.module` + `last_updated` and add entries in Phase 2 as you author this repo's own companion-YAML schemas (do not copy FW/CS schemas here).
- Initial commit + submodule-pin commit landed.
- Governance submodules added at latest tagged versions (or operator-supplied pins).
- `git config core.hooksPath Workflows/hooks` set so the commit-subject gate is active.
- `Workflows/{push,pull,validate,tag,deliver}.ps1` emitted: the five **thin-shell** pipeline delegates (fw-T3.C1.S3.SS1/SS2), each forwarding to the pinned FW canonical script. `deliver.ps1` cuts a **`-d` delivery baseline** (separate tag namespace from the `-v` SemVer chain); pass a conforming `-DeliveryTag` per cs-T5.C1.S17.SS12. Run `deliver.ps1 -DryRun` and review the generated `Project/deliveries/<tag>-manifest.md` before a first real delivery.

> **Fresh clone of this repo?** Git clones neither hooks nor `core.hooksPath` (it is local config). After cloning, run `git config core.hooksPath Workflows/hooks` once -- or simply run any `Workflows/*.ps1` shell, which self-activates it -- so the commit-msg gate is live before your first commit (cs-T5.C1.S17.SS3).

> **`_sandbox/!Dump/` is a permanent inbox** (fw-T7.C1.S5.SS5): prune individual items once fully consumed, but never delete the folder. The emitted `Workflows/post-commit.d/30-sandbox-hygiene.ps1` hook surfaces stale `_sandbox/` items after a commit -- advisory only; it never deletes. **`_sandbox/` is gitignored and never committed** (it holds local scratch), so it does NOT travel on a clone -- `new-project.ps1` creates `_sandbox/!Dump/` at Phase 1, and any `Workflows/*.ps1` run recreates it if it's missing. If you land in a fresh clone and `_sandbox/!Dump/` isn't there, just create it (or run any `Workflows/*.ps1`).

> **Resuming work?** (new session, agent swap, or this repo cloned elsewhere) -- per fw-T7.C1.S18.SS1, read `Project/STANDING-STATE.md` (standing state + next steps) + the task ledger (`Project/dev-tasks/` items if enabled, fw-T4.C1.S17) + the latest change-log/minutes BEFORE continuing, and keep `STANDING-STATE.md` current as you work + before handing off (fw-T7.C1.S18.SS2).

## What you do (Phase 2)

### Step 1: read canonical bylaws

Read each of the following Sections from the just-checked-out submodules:

1. **cs-T5 asset_id grammar + cs-T5.C1.S17 project naming/initialization** -- `Governance/_GOV-CodedStructures/Definition/Narratives/Title-5-...`
   WHY: cs-T5 defines the asset_id format; cs-T5.C1.S17 defines the project-repository name shapes (`_GOV-<Name>` / `DEV-<hier-path>_<ProjectType>` / `US<ST>P<NN>-<Subject>`) and the no-publish-before-final-name + rename-not-recreate discipline you follow in Phase 2.

2. **cs-T8 project taxonomy** -- `Governance/_GOV-CodedStructures/Definition/Narratives/Title-8-...`
   WHY: defines the project types (ACS / ECP / SCADA / MHS / QESH / BOS / IT) and their structural implications.

3. **fw-T4.C1.S6 Naming Conventions** -- `Governance/_GOV-DesignFramework/Definition/Narratives/Title-4-Structure/Chapter-1-General/Section-6-Naming-Conventions.md`
   WHY: FW's naming conventions for module/asset names; complements cs-T5. Also read **fw-T4.C1.S3** (module content model, fw-v0.33.0): **repo-module** (own repo) / **embedded module** (in-tree) / **reference** content-type -- an internal **clone** (`00-instance-of.md` + `prime-source: <prime-code>`) or an external import (`reference.yml`, `kind: external-import`). ("Shape 1/2/3" and source/twin are retired.)

4. **fw-T11.C1.S1 Scope Declaration** -- `Governance/_GOV-DesignFramework/Definition/Narratives/Title-11-Inter-Module-Governance/Chapter-1-General/Section-1-Scope-Declaration.md`
   WHY: every project declares its scope per T11.C1.S1; you'll populate the scope block in compatibility.yaml.

5. **fw-T9.C1.S5 Interface and Composition Manifests** -- `Governance/_GOV-DesignFramework/Definition/Narratives/Title-9-Interfaces/Chapter-1-General/Section-5-Interface-and-Composition-Manifests.md`
   WHY: schemas for interfaces.yaml and composition.yaml you'll author.

6. **fw-T8.C1.S9 Module Documentation Suite + Gap Audit** -- `Governance/_GOV-DesignFramework/Definition/Narratives/Title-8-Documentation/Chapter-1-General/Section-9-Module-Documentation-Suite-and-Gap-Audit.md`
   WHY: the four-file canonical doc-set you'll author (docs/README.md + FUNCTIONAL.md + INTERFACES.md + CHANGES.md).

### Step 2: elicit project metadata from the operator

Interactive Q&A through the operator-elicitation flow per fw-T3.C1.S7.SS3:

- Project type (cs-T8 taxonomy: ACS / ECP / SCADA / MHS / QESH / BOS / IT).
- Location code (cs-T1 E-tree).
- Function (cs-T2).
- Type-class (cs-T3).
- Discipline (cs-T4 D-tree).
- ISO 81346 aspects (per cs-T5).

Construct the asset_id + proposed folder name per cs-T5 grammar + fw-T4.C1.S6. Cite the relevant clauses to the operator; iterate until confirmed.

### Step 3: populate the scaffold

- Update `compatibility.yaml`: replace `<PHASE-2-FILL>` placeholders with project-type type_ref + scope block. Set governance.owner_rule + governance.module appropriately.
- Author `interfaces.yaml` per fw-T9.C1.S5 (use `interfaces: []` if no interfaces yet).
- Author `composition.yaml` per fw-T9.C1.S5 ONLY if multi-module. Give each module entry a 1-2 sentence `summary:` -- the document meta-frontpage cover (fw-T8.C1.S11.SS8) synthesizes its module list + summaries from here (and the charter + pins). Recommended now; Mandatory once FW's cover generator ships.
- Author `docs/README.md` + `docs/FUNCTIONAL.md` + `docs/INTERFACES.md` + `docs/CHANGES.md` per fw-T8.C1.S9 (project-aware content; NOT stubs).
- Populate `Workflows/ownership/parties.yaml` + `Workflows/ownership/stakeholders.yaml` per fw-T2.C1.S10 (Party/Stakeholder model). The Phase-1 stubs start empty (`parties: []` / `systems: []`); give each party an `id:` of the form `pty-<kebab>` per cs-T5.C1.S17.SS6. Prefer a **role/title referent** for the `party_id` (fw-T2.C1.S10.SS5), with optional `holder: <party_id>` pointing at the person filling the role. `entra_id` is OPTIONAL -- it only resolves when `Workflows/identity-map.yaml` is present (fw-T2.C1.S10.SS1/SS3); under `workflow_mode: direct` you need neither `Workflows/OWNERS` nor `identity-map.yaml` (fw-T5.C1.S11.SS3) -- add them only if you use the EntraID/CODEOWNERS chain.
- Review/extend `access.yaml` per fw-T6.C1.S4: the Phase-1 stub grants `Definition/Narratives/` = `write` and leaves everything else read-only. Add `write` paths for ASCII source this project maintains and `swap-only` for binaries/DWGs/exports; never list consumed-submodule paths (fw-T6.C1.S4.SS2).
- Create the `Definition/` subfolders this project needs from the fw-T4.C1.S2 vocabulary AS CONTENT WARRANTS (`Software/` = source, `Drawings/` source vs `Drawings/exports/`, `Firmware/`, `Fabrication/`, `Configuration/`, `Datasets/`, `Libraries/`). Do not pre-create empty subfolders you will not use.
- If the project's primary deliverable is a single coherent thing, designate (at most one) eigen-module under `modules/` and name it per cs-T5.C1.S17.SS7 (`<leaf>_<ProjectType>`, derived from this repo's `DEV-...` name); skip its `Definition/Narratives/Modules/<eigen>/` mirror (fw-T4.C1.S3.SS10).
- (Optional) Enable **dev-tracking** per fw-T4.C1.S17: copy `Definition/References/templates/dev-tracking/` from the pinned FW submodule into `Project/dev-tasks/` (item files + the Dataview `board`/`bugs`/`backlog`/`roadmap` views). `item_id` = `<TYPE>-<YYYY>-<NNN>` (FW-owned); `assignee` = a `pty-<kebab>` party_id (cs-T5.C1.S17.SS6). The `dev-tracking-items` WARN CI auto-discovers once present (never blocks). Skip it if the project stays on the lightweight loose-note pattern (fw-T4.C1.S15.SS5).

### Step 4: validate

Run the FW submodule's validate.ps1:

```powershell
.\Governance\_GOV-DesignFramework\Definition\References\scripts\validate.ps1
```

Iterate until 0 errors. If validate.ps1 detects this is Phase-1-incomplete (BOOTSTRAP.md present + docs/{4 files} absent), it should exit cleanly with an informational message; otherwise it fires the full validator chain.

### Step 5: commit + push

**Canonical-name gate first (cs-T5.C1.S17.SS3).** BEFORE configuring any remote or pushing, run the CS name-checker on the final folder name:

```powershell
.\Governance\_GOV-CodedStructures\Definition\References\scripts\introspection\Test-CanonicalProjectName.ps1 -Name "<final-folder-name>"
```

It must report CANONICAL (exit 0). If it reports NOT CANONICAL, stop and reconcile the name (rename-not-recreate per cs-T5.C1.S17.SS3) before any remote-add or push.

Then surface three push-path options to the operator:

a. **Existing remote configured**: `git push -u origin main`.
b. **`gh repo create` (GitHub CLI -- OPTIONAL, only if installed)**: verify with `gh --version` FIRST; if present (and `gh auth login` done), `gh repo create <name> --private --source=. --remote=origin --push`. If `gh` is NOT installed, do NOT assume it -- use (a) or (c).
c. **Operator-created externally**: create the empty private repo on GitHub, then `git remote add origin <url>; git push -u origin main`.

Agent asks; operator selects; agent executes. (The Phase-1 `[0/9]` pre-flight already reported whether `gh` is present.)

### When done

You're done when validate.ps1 passes AND the operator has confirmed the proposed name + asset_id AND the project commit has pushed to its origin.

---

If you hit any ambiguity in the bylaws or operator direction, flag per fw-T7.C1.S3 (Flag Rule Conflicts). Cite rule IDs per fw-T7.C1.S2.
