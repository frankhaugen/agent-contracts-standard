# agent-contracts-standard

Agent-facing context for maintaining the **Agent Contracts Standard (ACS)** reference repository and its templates, examples, and normative spec.

## Project overview

- **Purpose:** Publish ACS v0.1: normative rules in [`spec/ACS-v0.1.md`](spec/ACS-v0.1.md), copy-paste material in [`templates/`](templates/), worked trees in [`examples/`](examples/), and background in [`docs/`](docs/).
- **Audience:** Humans read [`README.md`](README.md); coding agents should read this file and then `.ai/`.

## Build and test

There is no compiled product. Validate edits by re-reading affected paths for consistency with the normative spec (§1). Optional: run a Markdown link checker if you have one configured locally.

## Security considerations

Do not commit credentials, private URLs, or unpublished embargoed content. Treat the repository as public.

## Agent contract (ACS)

This repository dogfoods ACS: the full contract lives under [`.ai/`](.ai/index.md). Start at `.ai/index.md` for instructions, policies, skills, commands, and context.

## Required reads

1. `.ai/index.md`
2. `.ai/instructions/`
3. `.ai/policies/`

## Rules

- Follow `.ai/instructions/` before changing normative spec text (§1).
- Enforce `.ai/policies/` at all times.
- Use `.ai/skills/` when a task matches a packaged skill.
- Use `.ai/commands/` for named workflows when applicable.
- Keep [AGENTS.md](https://agents.md/) and [Agent Skills](https://agentskills.io/) alignment when editing entry files or `SKILL.md` packages.
