# agent-contracts-standard

Agent-facing context for maintaining the **Agent Contracts Standard (ACS)** reference repository: normative spec, templates, examples, strict self-verification, and governance.

## Project overview

| Path | Role |
|------|------|
| [`spec/ACS-v0.1.md`](spec/ACS-v0.1.md) | Normative standard (**§1 only**; no repository layout in the spec file) |
| [`templates/`](templates/) | Copy-paste ACS starter for other repositories |
| [`examples/`](examples/) | Minimal and full non-normative examples |
| [`docs/`](docs/) | Rationale, standards-alignment, standards-landscape (informative) |
| [`scripts/Verify-AcsRepo.ps1`](scripts/Verify-AcsRepo.ps1) | **Strict** self-verification for **this** repo |
| [`.ai/`](.ai/index.md) | **Complete** agent contract for editing the standard (dogfood) |

This repository **intends full ACS v0.1 compliance** for its own layout: root `AGENTS.md`, `.ai/index.md`, and all contract categories populated under `.ai/` per `spec/ACS-v0.1.md` §1.4–§1.7.

## Build and test

- **No compiled product.** Validate with `pwsh ./scripts/Verify-AcsRepo.ps1` from the repository root (PowerShell 7+). The same checks run in [GitHub Actions](.github/workflows/ci.yml). To scaffold `templates/` elsewhere, use [`scripts/Spawn-AcsTemplate.ps1`](scripts/Spawn-AcsTemplate.ps1) or `dotnet run --project scripts/SpawnAcsTemplate.csproj -- <path>`.
- Optional: Markdown link checkers or `skills-ref validate` on skill directories if installed locally.

## Security considerations

Do not commit credentials or private URLs. For vulnerability reports, see [SECURITY.md](SECURITY.md).

## Agent contract (ACS)

The **entire** machine-oriented contract for working **in this repo** lives under [`.ai/`](.ai/index.md). **Start there**, not only this file: resolution order is `AGENTS.md` → `.ai/index.md` → instructions → policies → skills → commands → context (`spec/ACS-v0.1.md` §1.7).

### Required reads (minimum)

1. [`.ai/index.md`](.ai/index.md) — canonical index of all contracts below.
2. **All** of [`.ai/instructions/`](.ai/instructions/) — editorial and structural rules for the standard.
3. **All** of [`.ai/policies/`](.ai/policies/) — hard constraints for this publication.

Then use **skills** for packaged workflows (normative edit, template sync, audit, `AGENTS.md` review, skill packaging), **commands** for named procedures (verify, audit, version bump, PR review), and **context** for checklists and the MCP tool-shape mirror.

## Rules

- **Never** edit `spec/ACS-v0.1.md` without **explicit human maintainer instruction** recorded in an issue or PR — see [`.ai/policies/spec-file-human-authorization.md`](.ai/policies/spec-file-human-authorization.md).
- Follow **instructions** before changing **§1** normative text; enforce **policies** at all times.
- Activate the **skill** that matches the task (see `.ai/index.md` § Skills).
- Use **commands** for structured maintainer workflows (verify layout, audit compliance, version bump, PR normative review).
- Do not introduce conventions that **contradict** `spec/ACS-v0.1.md` §1 without a deliberate version strategy and `CHANGELOG.md` entry.
- Keep [AGENTS.md](https://agents.md/) and [Agent Skills](https://agentskills.io/specification) alignment for the root entry file and every `.ai/skills/<id>/SKILL.md` package.

## Community (humans)

[CONTRIBUTING.md](CONTRIBUTING.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md), and [README.md](README.md) for contributors and project overview.
