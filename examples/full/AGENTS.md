# Example application (full ACS layout)

Illustrative repository for agents: a fictional service with tests, PR review flow, and generated artifacts. Replace with your real project name and details.

## Project overview

- **Stack:** (example) TypeScript, Node.js
- **Layout:** `src/` for code, `tests/` for automated tests, `.ai/` for the agent contract per ACS v0.1
- **Humans:** start at `README.md` for contributor onboarding

## Build and test

```text
npm install
npm run build
npm test
```

Adjust commands to match your toolchain.

## Security considerations

Do not commit API keys or production URLs. Treat logs and customer data as sensitive unless documented otherwise.

## Agent contract (ACS)

This repository uses `.ai/` as the canonical contract. Open `.ai/index.md` for the full list of instructions, policies, skills, commands, and context.

## Required reads

1. `.ai/index.md`
2. `.ai/instructions/`
3. `.ai/policies/`

## Rules

- Follow instructions before making changes
- Enforce policies at all times
- Use skills when applicable (Agent Skills under `.ai/skills/<skill-id>/`)
- Use commands for structured workflows
- Do not introduce new conventions if defined in `.ai/`
