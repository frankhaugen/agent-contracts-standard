# Changelog

All notable changes to this repository will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html)
for the **standard document** version (see [spec/ACS-v0.1.md](spec/ACS-v0.1.md) §2.5).

## [0.1.6] - 2026-05-01

### Added

- **Strict dogfood `.ai/` contract:** five instructions, four policies, five Agent Skills (`acs-normative-edit`, `acs-sync-templates-examples`, `acs-compliance-audit`, `acs-agents-md-review`, `acs-skill-edits`), four commands, and expanded context (`compliance-checklist.md`, `maintainer-contract-matrix.md`).
- [`scripts/verify_acs_repo.py`](scripts/verify_acs_repo.py): automated checks for required files, minimum contract counts, skill `name` vs directory, and `.ai/index.md` §1.7 section order.
- CI runs the Python verifier (replaces duplicate inline file list).

### Changed

- Root [`AGENTS.md`](AGENTS.md) and [`.ai/index.md`](.ai/index.md) updated for full discoverability and maintainer workflows.
- [`spec/ACS-v0.1.md`](spec/ACS-v0.1.md) §2.1 diagram includes `scripts/verify_acs_repo.py`.

## [0.1.5] - 2026-05-01

### Added

- Repository best practices: [CONTRIBUTING.md](CONTRIBUTING.md), [SECURITY.md](SECURITY.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) (Contributor Covenant 2.1).
- [.editorconfig](.editorconfig) and [.gitattributes](.gitattributes) for consistent text encoding and line endings.
- [GitHub Actions](.github/workflows/ci.yml) workflow to verify required spec, template, and example paths exist.
- [Issue forms](.github/ISSUE_TEMPLATE/) and [pull request template](.github/pull_request_template.md).
- README **Community** section; spec §2.1 and §1.10 updated to mention these files.

## [0.1.4] - 2026-05-01

### Changed

- Spec: add **metadata**, **copyright**, **abstract**, and **status**; cite **[BCP14]** / **[RFC2119]** / **[RFC8174]** for keywords without redefining RFC prose.
- Spec: **§1.9 Normative references**, **§1.10 Informative references**, **§1.11 Acknowledgments**; align §1.2 with reference IDs (**AGENTS-MD**, **MCP-SPEC**, **AGENT-SKILLS**).
- Docs and maintainer instructions point to normative reference tables.

## [0.1.3] - 2026-05-01

### Changed

- Spec: add §1.0 **Conformance terminology** (BCP 14 / RFC 2119) so **MUST** / **SHOULD** / **MAY** are defined normative terms, not informal advice.
- Spec: Agent Skills alignment for skill packages under `.ai/skills/` is now **MUST** (consistent with §1.6 Skill definition).

## [0.1.2] - 2026-05-01

### Added

- Root [AGENTS.md](AGENTS.md) and [`.ai/`](.ai/index.md) so this repository matches ACS entry + contract layout.
- MCP documentation: `mcp-tools.md` instructions and `mcp-tool-contract.json` context in templates and full example.

### Changed

- **Normative:** Skills use Agent Skills package layout (`.ai/skills/<skill-id>/SKILL.md`); updated §1.4, §1.6, §1.2 alignment, and §2.x diagrams.
- **AGENTS.md** (templates, examples, root): align with [agents.md](https://agents.md/) (overview, build/test, security) while keeping ACS discovery and rules.
- **Skills:** Replaced flat `*.md` skills with valid `SKILL.md` front matter per [Agent Skills](https://agentskills.io/specification).

## [0.1.1] - 2026-05-01

### Fixed

- Align `templates/.ai/index.md` with spec §2.2 (literal `<list>` placeholders).
- Align `examples/minimal/` with spec §2.3 (remove extra `.ai/` subtrees; index lists only present contracts).
- Order `examples/full/.ai/index.md` sections per normative resolution order (§1.7).

## [0.1.0] - 2026-05-01

### Added

- Initial publication of **Agent Contracts Standard (ACS) v0.1** in `spec/ACS-v0.1.md`.
- `templates/` reference tree: `AGENTS.md`, `.ai/index.md`, and example stubs per contract type.
- `examples/minimal/` and `examples/full/` worked layouts.
- Non-normative `docs/rationale.md` and `docs/standards-alignment.md`.

