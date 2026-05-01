# [Project or repository name]

Brief agent-focused summary (one or two sentences). Replace this heading and paragraph with your project.

## Project overview

Describe tech stack, repository layout, and where human docs live (for example `README.md`). This section follows [AGENTS.md](https://agents.md/) guidance: give agents the context a new teammate would need.

## Build and test

List install, build, lint, and test commands. If there is no automated build, say so explicitly.

## Security considerations

How to handle secrets, production access, and sensitive data.

## Agent contract (ACS)

This repository uses `.ai/` as the canonical agent contract (for example ACS v0.1). Link to your normative spec or policy document here if you maintain one. Start at `.ai/index.md` for every instruction, skill, command, policy, and context file.

## Required reads

1. `.ai/index.md`
2. `.ai/instructions/`
3. `.ai/policies/`

## Rules

- Follow instructions before making changes
- Enforce policies at all times
- Use skills when applicable (each skill is an [Agent Skills](https://agentskills.io/) package under `.ai/skills/<skill-id>/`)
- Use commands for structured workflows
- Do not introduce new conventions if defined in `.ai/`
- Keep ACS-required agent material in `AGENTS.md` and under `.ai/`; do not satisfy the contract solely through editor- or vendor-specific rule paths (see your ACS spec Section 6 if you claim compliance)
- Do **not** add paths forbidden by your ACS spec Section 6.3 *Forbidden paths* (for example any `.cursor`/`.copilot`/`.claude` path, `.github/copilot-instructions.md`, or `.github/instructions/`)
