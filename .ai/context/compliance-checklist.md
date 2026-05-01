# Repository self-compliance checklist (context)

**ACS type:** Context (read-only maintainer aid)

Checklist for **agent-contracts-standard** as an ACS v0.1 dogfood repository. Automated checks: `python3 scripts/verify_acs_repo.py`.

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

Update this table when the repository tightens or relaxes self-checks.
