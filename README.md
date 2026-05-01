# Agent Contracts Standard (ACS)

This repository publishes **ACS v0.1**: a small, vendor-neutral layout for agent-facing contracts in a Git repository, plus templates and examples. It also follows ACS at the root: [AGENTS.md](AGENTS.md) and [`.ai/`](.ai/index.md), with **strict** maintainer contracts (instructions, policies, skills, commands, context) and [`scripts/Verify-AcsRepo.ps1`](scripts/Verify-AcsRepo.ps1) for self-verification. Scripts in `scripts/` are **PowerShell (`.ps1`)** or **C#** only.

- **Normative spec:** [spec/ACS-v0.1.md](spec/ACS-v0.1.md)
- **Copy-paste starter:** [templates/](templates/)
- **Worked layouts:** [examples/minimal/](examples/minimal/) and [examples/full/](examples/full/)
- **Background:** [docs/rationale.md](docs/rationale.md), [docs/standards-alignment.md](docs/standards-alignment.md), [docs/standards-landscape.md](docs/standards-landscape.md) (ACS vs existing domain standards), [docs/publisher-layout-and-templates.md](docs/publisher-layout-and-templates.md) (how **this** repo ships spec + templates; not part of ACS)
- **Changes:** [CHANGELOG.md](CHANGELOG.md)

## Community

- [Contributing](CONTRIBUTING.md) — branches, PRs, normative vs non-normative changes
- [Security policy](SECURITY.md) — report vulnerabilities privately
- [Code of conduct](CODE_OF_CONDUCT.md)
- [`CODEOWNERS`](CODEOWNERS) — pull requests under `spec/` request review from the spec owner

## What ACS defines

ACS defines **contract taxonomy**, **required paths** under `.ai/`, **file roles**, **resolution order**, and **vendor neutrality** for repository contracts (Section 1.5). It does **not** define runtimes or orchestration. See Section 1.1 in the spec.

## Compliance (summary)

A repository is **ACS v0.1 compliant** if:

- `AGENTS.md` exists at the repository root.
- `.ai/index.md` exists.
- Agent contracts live under `.ai/` and use the ACS taxonomy.
- Vendor neutrality per spec Section 1.5 (no **required** dependence on vendor-specific agent artifacts; **Forbidden paths** such as any `.cursor`/`.copilot`/`.claude` tree and GitHub Copilot paths under `.github/` **MUST NOT** exist—see spec).
- Everything is discoverable starting from `AGENTS.md`.

Compliance checklist: [Section 1.8](spec/ACS-v0.1.md#18-compliance). **Normative references** (BCP 14, AGENTS.md, MCP, Agent Skills): [Section 1.9](spec/ACS-v0.1.md#19-normative-references).

## Using this repo

| Goal | Where to start |
|------|----------------|
| Adopt ACS in a new repo | Copy [templates/AGENTS.md](templates/AGENTS.md) and [templates/.ai/](templates/.ai/) into your project, then replace examples with real contracts. |
| See the minimal example tree | [examples/minimal/](examples/minimal/) — described in [docs/publisher-layout-and-templates.md § Example minimum](docs/publisher-layout-and-templates.md#example-minimum). |
| See every contract type populated | [examples/full/](examples/full/) |
| Scaffold the template into a folder | `pwsh ./scripts/Spawn-AcsTemplate.ps1 -Destination <path>` or `dotnet run --project scripts/SpawnAcsTemplate.csproj -- <path>` |

## Versioning

**v0.1** is the initial composition standard. See the version field in [`spec/ACS-v0.1.md`](spec/ACS-v0.1.md) metadata and [docs/publisher-layout-and-templates.md § Document version identifier](docs/publisher-layout-and-templates.md#document-version-identifier-this-publication).

## License

MIT — see [LICENSE](LICENSE).
