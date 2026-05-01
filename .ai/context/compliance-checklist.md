# Repository self-compliance checklist (context)

**ACS type:** Context (read-only maintainer aid)

Checklist for **agent-contracts-standard** as an ACS v0.1 dogfood repository. Automated checks: `pwsh ./scripts/Verify-AcsRepo.ps1`.

| # | Requirement (spec §) | Check |
|---|----------------------|--------|
| 1 | §1.8 `AGENTS.md` at root | File exists |
| 2 | §1.8 `.ai/index.md` | File exists |
| 3 | §1.5 Discoverable from `AGENTS.md` | Link/citation to `.ai/index.md` |
| 4 | §1.4 All contract directories used | `instructions/`, `policies/`, `skills/`, `commands/`, `context/` each have ≥1 artifact |
| 5 | §1.6 Skills = Agent Skills packages | Each `.ai/skills/<id>/SKILL.md` has `name: <id>` |
| 6 | §1.7 Index section order | Instructions → Policies → Skills → Commands → Context |
| 7 | §1.2 External refs | §1.9 table matches §1.2 IDs |
| 8 | Governance | `CONTRIBUTING.md`, `SECURITY.md`, `CODE_OF_CONDUCT.md` present |
| 9 | Spec edit authorization | [spec-file-human-authorization.md](../policies/spec-file-human-authorization.md) present; agents trained not to edit `spec/` without maintainer issue/PR |

Update this table when the repository tightens or relaxes self-checks.
