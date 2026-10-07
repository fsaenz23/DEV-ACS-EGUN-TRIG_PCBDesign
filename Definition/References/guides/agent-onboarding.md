---
title: Agent Onboarding (TEMPLATE -- Phase-1 baseline; Phase-2 agent fills this in)
audience: agent
agent_consumable: true
binding: false
governed_by: T7.C1.S17
note: Phase-1 mechanical baseline emitted by new-project.ps1 per T7.C1.S17.SS5. The Phase-2 agent-bootstrap fills the bracketed sections with module-specific content. Guidance, not bylaws -- cite rules by id; never restate (T7.C1.S17.SS4).
updated: 2026-06-04
---

# <MODULE> Agent Onboarding

**This is a lens, not the source of truth.** It points at binding rules by id; the cited Section governs (T7.C1.S17.SS4). Where this guide and a Section disagree, the Section wins -- log the discrepancy in `agent-discovery-log.md`.

## 1. Who you are / what this repo is
<Phase 2: module identity, project type, what this repo governs/contains, and what it pins (FW, CS).>

## 2. Canonical paths
- Bylaws / content: <Phase 2: this module's canonical homes>.
- Scripts: `Workflows/` (thin delegates to the pinned Framework's `Definition/References/scripts/`).
- History: `change-log.md` + `minutes/`. Cross-agent transport: a non-codified dev-period handoff channel -- never named by literal path in bylaws (fw-T8.C1.S4.SS7).

## 3. Inherited Framework disciplines (rule-id -> one-line effect)
- fw-T7.C1.S13.SS2 -- commit pipeline validate -> push -> tag.
- fw-T7.C1.S13.SS3 / fw-T7.C1.S14.SS2 -- read the script transcript; "done" != "clean".
- fw-T7.C1.S9.SS8 -- double-check changes; verify completeness claims against committed git state, not the working-tree mount.
- fw-T7.C1.S14.SS7 -- end every response with a `Next Steps:` block.
- fw-T7.C1.S17 -- keep this onboarding home living; record discoveries; graduate stable lessons.
- fw-T11.C1.S8 -- framework tags first in a paired ship.
<Phase 2: add module-specific rules + the cs-/fw- quickref pointers.>

## 4. First-action checklist
1. Read AGENTS.md + this guide + the discovery log.
2. Confirm state off committed git, not a possibly-fogged working-tree read.
3. Change -> operator runs validate/push (read transcript) -> tag.
4. End every response with `Next Steps:`.

## Related
fw-T7.C1.S17 (this rule), fw-T7.C1.S1, fw-T7.C1.S9, fw-T7.C1.S13, fw-T7.C1.S14 -- read the Sections for normative detail.
