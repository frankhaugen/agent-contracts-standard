# Repository self-compliance checklist (context)

**ACS type:** Context (read-only maintainer aid)

Checklist for **agent-contracts-standard** as an ACS v0.1 dogfood repository. Automated checks: `pwsh ./scripts/Verify-AcsRepo.ps1`.

| # | Requirement (spec) | Check |
|---|----------------------|--------|
| 1 | Section 9 — `AGENTS.md` at root | File exists |
| 2 | Section 9 — `.ai/index.md` | File exists |
| 3 | Section 6 — Discoverable from `AGENTS.md` | Link/citation to `.ai/index.md` |
| 3b | Section 6 — Vendor neutrality | No sole reliance on vendor-specific agent artifacts (see Section 6.4) |
| 3c | Section 6.3 — Forbidden paths | No `.copilot`/`.claude`/`.cursor` anywhere in tree (except under `.git`); no `.github/copilot-instructions.md`, `.github/copilot/`, `.github/instructions/`, or `.github/prompts/` (`Verify-AcsRepo.ps1` enforces on this repo) |
| 4 | Section 5 — All contract directories used | `instructions/`, `policies/`, `skills/`, `commands/`, `context/` each have ≥1 artifact |
| 5 | Section 7 — Skills = Agent Skills packages | Each `.ai/skills/<id>/SKILL.md` has `name: <id>` |
| 6 | Section 8 — Index section order | Instructions → Policies → Skills → Commands → Context |
| 7 | Sections 3 / 10 — External refs | Section 10 table matches Section 3 IDs |
| 8 | Governance | `CONTRIBUTING.md`, `SECURITY.md`, `CODE_OF_CONDUCT.md` present |
| 9 | Spec edit authorization | [spec-file-human-authorization.md](../policies/spec-file-human-authorization.md) present; agents trained not to edit `spec/` without maintainer issue/PR |

Update this table when the repository tightens or relaxes self-checks.
