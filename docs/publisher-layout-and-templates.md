# Publisher layout and templates (not part of ACS)

**This document is not part of the Agent Contracts Standard.** It describes how **this publication** (`agent-contracts-standard`) ships the normative spec file alongside templates, examples, and supporting docs. ACS compliance for **other** repositories is defined **only** by `spec/ACS-v0.1.md` §1.

---

## Repository layout (this publication)

```text
agent-contracts-standard/
  README.md
  LICENSE
  CHANGELOG.md

  scripts/
    Verify-AcsRepo.ps1
    Spawn-AcsTemplate.ps1
    SpawnAcsTemplate.cs
    SpawnAcsTemplate.csproj

  spec/
    ACS-v0.1.md

  templates/
    AGENTS.md
    .ai/
      index.md
      instructions/
        example.md
        mcp-tools.md
      skills/
        example-skill/
          SKILL.md
      commands/
        example.md
      policies/
        example.md
      context/
        example.md
        mcp-tool-contract.json

  examples/
    minimal/
      AGENTS.md
      .ai/
        index.md
        instructions/
          repository.md
        policies/
          safety.md

    full/
      AGENTS.md
      .ai/
        index.md
        instructions/
          architecture.md
          testing.md
          mcp-tools.md
        skills/
          write-tests/
            SKILL.md
        commands/
          review-pr.md
        policies/
          generated-files.md
        context/
          repo-map.md
          mcp-tool-contract.json

  docs/
    rationale.md
    standards-alignment.md
    publisher-layout-and-templates.md
```

---

## Template requirements (informative)

### AGENTS.md (entry contract)

**Aligned with [AGENTS.md](https://agents.md/):** root-level Markdown, agent-focused sections (for example project overview, build and test commands, security considerations). There are no required headings in the AGENTS.md format; use whatever helps agents work in the repo.

**Aligned with ACS:** include enough pointers that the full contract under `.ai/` is discoverable from this file alone.

Recommended combined shape:

```md
# [Project or repository name]

Brief agent-focused summary (one or two sentences).

## Project overview

Context agents need: tech stack, layout, where authoritative docs live.

## Build and test

Commands to install, build, lint, and test (or explicit “none” / “see CI”).

## Security considerations

Secrets handling, production access, data sensitivity.

## Agent contract (ACS)

This repository uses `.ai/` as the canonical agent contract. Start at `.ai/index.md` for every instruction, skill, command, policy, and context file.

## Required reads

1. `.ai/index.md`
2. `.ai/instructions/`
3. `.ai/policies/`

## Rules

- Follow instructions before making changes
- Enforce policies at all times
- Use skills when applicable (Agent Skills packages under `.ai/skills/<skill-id>/`)
- Use commands for structured workflows
- Do not introduce new conventions if defined in `.ai/`
```

### `.ai/index.md`

```md
# AI Contract Index

## Instructions
<list>

## Skills
<list>

## Commands
<list>

## Policies
<list>

## Context
<list>
```

Replace `<list>` with links or bullet lists of files in each directory.

---

## Example minimum

```text
AGENTS.md
.ai/
  index.md
  instructions/
    repository.md
  policies/
    safety.md
```

---

## Example full

```text
AGENTS.md
.ai/
  index.md
  instructions/
    architecture.md
    testing.md
  skills/
    write-tests/
      SKILL.md
  commands/
    review-pr.md
  policies/
    generated-files.md
  context/
    repo-map.md
    mcp-tool-contract.json
```

The `mcp-tool-contract.json` file is an optional **documentation mirror** of the MCP tool descriptor shape from the normative spec §1.2; live tools are still defined in MCP configuration.

---

## Document version identifier (this publication)

```text
v0.1 = initial composition standard
```

The **normative** edition identifier for ACS is also recorded in the metadata table at the top of `spec/ACS-v0.1.md`.
