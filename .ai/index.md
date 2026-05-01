# AI Contract Index

Contract for the **agent-contracts-standard** repository. Section order follows **ACS Section 8** (instructions → policies → skills → commands → context).

## Instructions

| File | Purpose |
|------|---------|
| [maintaining-the-spec.md](instructions/maintaining-the-spec.md) | Hub: normative vs informative, contribution pointer |
| [bcp14-requirement-keywords.md](instructions/bcp14-requirement-keywords.md) | Bold **MUST** / **SHOULD** / **MAY** in spec Sections 1–10 |
| [normative-vs-informative.md](instructions/normative-vs-informative.md) | Spec vs publisher `docs/` / templates / examples |
| [normative-references-maintenance.md](instructions/normative-references-maintenance.md) | Section 10 reference table hygiene |
| [templates-examples-parity.md](instructions/templates-examples-parity.md) | Keep templates & examples aligned with the spec |
| [spec-change-gate.md](instructions/spec-change-gate.md) | Gate before editing `spec/ACS-v0.1.md` |

## Policies

| File | Purpose |
|------|---------|
| [spec-file-human-authorization.md](policies/spec-file-human-authorization.md) | **No** `spec/` edits without explicit human maintainer instruction |
| [spec-integrity.md](policies/spec-integrity.md) | No silent contradictions with the normative spec; single root entry |
| [discoverability-from-agents.md](policies/discoverability-from-agents.md) | All `.ai/` reachable from `AGENTS.md`; index updates |
| [vendor-neutrality-contracts.md](policies/vendor-neutrality-contracts.md) | Templates/examples stay vendor-neutral for ACS claims |
| [changelog-for-normative-changes.md](policies/changelog-for-normative-changes.md) | `CHANGELOG.md` when normative spec meaning changes |

## Skills

Agent Skills packages ([**AGENT-SKILLS**](https://agentskills.io/specification)):

| Skill | When to use |
|-------|----------------|
| [acs-normative-edit/SKILL.md](skills/acs-normative-edit/SKILL.md) | Editing `spec/ACS-v0.1.md` normative sections |
| [acs-sync-templates-examples/SKILL.md](skills/acs-sync-templates-examples/SKILL.md) | Parity for `templates/` and `examples/` |
| [acs-compliance-audit/SKILL.md](skills/acs-compliance-audit/SKILL.md) | Full self-compliance audit |
| [acs-agents-md-review/SKILL.md](skills/acs-agents-md-review/SKILL.md) | Review root `AGENTS.md` |
| [acs-skill-edits/SKILL.md](skills/acs-skill-edits/SKILL.md) | Create/edit any `SKILL.md` package in repo |

## Commands

| Command | Purpose |
|---------|---------|
| [verify-layout.md](commands/verify-layout.md) | Run `scripts/Verify-AcsRepo.ps1` (+ CI); spawn templates via `Spawn-AcsTemplate.ps1` / `SpawnAcsTemplate.csproj` |
| [audit-repo-compliance.md](commands/audit-repo-compliance.md) | End-to-end audit procedure |
| [prepare-version-bump.md](commands/prepare-version-bump.md) | Prepare new ACS version / migration |
| [review-pr-normative.md](commands/review-pr-normative.md) | Classify PR normative impact |

## Context

| Artifact | Purpose |
|----------|---------|
| [compliance-checklist.md](context/compliance-checklist.md) | Human/agent checklist vs normative spec |
| [maintainer-contract-matrix.md](context/maintainer-contract-matrix.md) | Map of this `.ai/` tree |
| [mcp-tool-contract.json](context/mcp-tool-contract.json) | MCP tool JSON shape (Section 3 documentation mirror) |
