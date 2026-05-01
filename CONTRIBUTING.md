# Contributing

Thank you for helping improve the Agent Contracts Standard (ACS) and this reference repository.

## Before you start

- Read [AGENTS.md](AGENTS.md) and [`.ai/index.md`](.ai/index.md) if you are changing normative text, templates, or examples.
- Normative rules live in [`spec/ACS-v0.1.md`](spec/ACS-v0.1.md) **§1**; **§2** and `docs/` are informative unless they duplicate §1.
- External alignment (BCP 14, AGENTS.md, MCP, Agent Skills) is listed in spec **§1.9**; do not contradict those references without a deliberate version bump.

## Verification (strict)

From the repository root, with Python 3.9+:

```bash
python3 scripts/verify_acs_repo.py
```

This checks required paths, `.ai/` category counts, Agent Skills `name` == directory, and `.ai/index.md` §1.7 heading order. CI runs the same script on every push and pull request to `main`.

## How to contribute

1. **Open an issue** (or discuss in an existing one) for substantive spec changes so maintainers can agree on direction.
2. **Fork** the repository and create a **branch** from `main` (for example `fix/spec-wording` or `feature/ci-verify`).
3. **Keep changes focused**—one logical change per pull request when possible.
4. **Update artifacts together** when §1 layout or paths change: `spec/ACS-v0.1.md`, `templates/`, `examples/`, root `.ai/` if applicable, and this file or `README.md` if discoverability changes.
5. **Add a [CHANGELOG.md](CHANGELOG.md)** entry under `[Unreleased]` or the next version section (see Keep a Changelog style already used in this repo).
6. **Open a pull request** against `main` with a clear title and description. Link related issues.

## Pull request checklist

- [ ] Normative (§1) edits are intentional and wording is consistent with **§1.0** (BCP 14 keywords in **bold**).
- [ ] Templates and examples still match the spec diagrams where they claim to.
- [ ] `CHANGELOG.md` updated if the change is user-visible.
- [ ] No secrets, credentials, or private data in commits.

## Code of conduct

Contributors are expected to follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Questions

Open a [GitHub issue](https://github.com/frankhaugen/agent-contracts-standard/issues) for questions about the standard or this repository.
