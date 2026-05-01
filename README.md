# Agent Contracts Standard (ACS)

This repository publishes **ACS v0.1**: a small, vendor-neutral layout for agent-facing contracts in a Git repository, plus templates and examples. It also follows ACS at the root: [AGENTS.md](AGENTS.md) and [`.ai/`](.ai/index.md).

- **Normative spec:** [spec/ACS-v0.1.md](spec/ACS-v0.1.md)
- **Copy-paste starter:** [templates/](templates/)
- **Worked layouts:** [examples/minimal/](examples/minimal/) and [examples/full/](examples/full/)
- **Background:** [docs/rationale.md](docs/rationale.md), [docs/standards-alignment.md](docs/standards-alignment.md)
- **Changes:** [CHANGELOG.md](CHANGELOG.md)

## What ACS defines

ACS defines **contract taxonomy**, **required paths** under `.ai/`, **file roles**, and **resolution order**. It does **not** define runtimes, orchestration, or vendor-specific behavior. See §1.1 in the spec.

## Compliance (summary)

A repository is **ACS v0.1 compliant** if:

- `AGENTS.md` exists at the repository root.
- `.ai/index.md` exists.
- Agent contracts live under `.ai/` and use the ACS taxonomy.
- Behavior does not depend on vendor-specific agent files.
- Everything is discoverable starting from `AGENTS.md`.

Full checklist: [spec/ACS-v0.1.md §1.8](spec/ACS-v0.1.md#18-compliance).

## Using this repo

| Goal | Where to start |
|------|----------------|
| Adopt ACS in a new repo | Copy [templates/AGENTS.md](templates/AGENTS.md) and [templates/.ai/](templates/.ai/) into your project, then replace examples with real contracts. |
| See the §2.3 minimal reference tree | [examples/minimal/](examples/minimal/) — matches the non-normative layout in [spec/ACS-v0.1.md §2.3](spec/ACS-v0.1.md#23-example-minimum). |
| See every contract type populated | [examples/full/](examples/full/) |

## Versioning

**v0.1** is the initial composition standard. See spec §2.5.

## License

MIT — see [LICENSE](LICENSE).
