# Maintainer contract matrix (context)

**ACS type:** Context

Quick map of **this** repository’s `.ai/` contracts for agents editing the standard.

| Category | Role here | Key files |
|----------|-----------|-----------|
| Instructions | Editorial rules for §1/§2, BCP 14, refs, parity, spec gate | `maintaining-the-spec.md`, `bcp14-requirement-keywords.md`, `normative-vs-informative.md`, `normative-references-maintenance.md`, `templates-examples-parity.md`, `spec-change-gate.md` |
| Policies | Hard gates (spec authorization, integrity, discoverability, vendor neutrality, changelog) | `spec-file-human-authorization.md`, `spec-integrity.md`, `discoverability-from-agents.md`, `vendor-neutrality-contracts.md`, `changelog-for-normative-changes.md` |
| Skills | Packaged workflows | `acs-normative-edit`, `acs-sync-templates-examples`, `acs-compliance-audit`, `acs-agents-md-review`, `acs-skill-edits` |
| Commands | Named procedures | `verify-layout`, `audit-repo-compliance`, `prepare-version-bump`, `review-pr-normative` |
| Context | Checklists and matrices | `compliance-checklist.md`, this file, `mcp-tool-contract.json` |
| Scripts (repo tooling) | Automated self-verification | `scripts/verify_acs_repo.py` (not an ACS contract type; supports compliance) |

**Resolution order** when loading contracts: `AGENTS.md` → `.ai/index.md` → instructions → policies → skills → commands → context (`spec/ACS-v0.1.md` §1.7).
