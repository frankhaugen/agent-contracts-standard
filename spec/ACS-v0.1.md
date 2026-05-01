# Agent Contracts Standard (ACS) v0.1

This document defines ACS v0.1. **Section 1** is normative. **Section 2** is non-normative (reference implementation and repository layout).

---

## 1. Standard (Normative Specification)

### 1.0 Conformance terminology

The key words **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** in this document are to be interpreted as described in [BCP 14](https://www.rfc-editor.org/info/bcp14) ([RFC 2119](https://www.rfc-editor.org/rfc/rfc2119.html) and [RFC 8174](https://www.rfc-editor.org/rfc/rfc8174.html)) when, and only when, they appear in bold (for example **MUST**). These words are normative: **SHOULD** means there can exist valid reasons to deviate, but that deviation should be understood and rare; it is not “optional” in the colloquial sense.

### 1.1 Scope

**Defines:**

- Contract taxonomy
- Required repository structure
- File roles and placement
- Resolution order

**Does not define:**

- Runtime/orchestration
- Execution engines
- Vendor-specific behavior

---

### 1.2 External Standards Alignment

#### Entry Contract

- **MUST** align with [AGENTS.md](https://agents.md/).

ACS uses `AGENTS.md` as the required repository entrypoint.

#### Tools / Execution

- **MUST** align with [Model Context Protocol](https://modelcontextprotocol.io/) (MCP).

Tool contract (ACS does not redefine this):

```json
{
  "name": "string",
  "description": "string",
  "input_schema": {}
}
```

#### Skills

- **MUST** conform to the [Agent Skills](https://agentskills.io/) [specification](https://agentskills.io/specification) for every skill package under `.ai/skills/` (directory layout, `SKILL.md` front matter, and naming rules).

ACS defines repository-local placement under `.ai/skills/<skill-id>/`; each such package **MUST** include `SKILL.md` with required YAML (`name`, `description`) and **MUST** satisfy Agent Skills constraints (including `name` matching the parent directory).

---

### 1.3 Contract Taxonomy

| Contract type   | Role                          |
|----------------|-------------------------------|
| Entry Contract | `AGENTS.md`                   |
| Instruction    | Persistent rules              |
| Skill          | Reusable capability           |
| Command        | Named workflow                |
| Tool           | MCP-compatible executable     |
| Policy         | Hard constraint               |
| Context        | Structured system data        |

---

### 1.4 Required Structure

```text
AGENTS.md
.ai/
  index.md
  instructions/
  skills/
    <skill-id>/
      SKILL.md
  commands/
  policies/
  context/
```

Each skill under `skills/` **MUST** follow the Agent Skills directory convention (`SKILL.md` plus optional `scripts/`, `references/`, and `assets/` only as defined by that specification).

---

### 1.5 Invariants

```text
- AGENTS.md is the only root agent entrypoint
- .ai/ contains the complete agent contract
- No vendor-specific agent files are required
- All agent behavior must be discoverable from AGENTS.md
```

---

### 1.6 Contract Definitions

#### Instruction

```text
Location: .ai/instructions/*.md
Scope: global
```

Persistent behavioral rules.

#### Skill

```text
Location: .ai/skills/<skill-id>/SKILL.md (and optional sibling files per Agent Skills)
Scope: task-level
```

Reusable capability definition. **Agent Skills:** `<skill-id>` is a directory name; `SKILL.md` **MUST** contain the required YAML front matter (`name`, `description`) per [Agent Skills](https://agentskills.io/specification); `name` **MUST** match the directory name. Optional `scripts/`, `references/`, and `assets/` subdirectories **MUST** follow that specification when present.

#### Command

```text
Location: .ai/commands/*.md
Scope: invoked workflow
```

Named execution process.

#### Policy

```text
Location: .ai/policies/*.md
Scope: always enforced
```

Hard constraint.

#### Context

```text
Location: .ai/context/*
Scope: read-only
```

Structured data.

#### Tool

```text
Defined externally (MCP)
Referenced within ACS
```

Executable operation. Declare tools in MCP server configuration; reference them from instructions, context, or commands using stable tool names. The MCP tool descriptor shape is fixed in §1.2; repository-local JSON or tables may mirror it for documentation (see non-normative templates).

---

### 1.7 Resolution Order

```text
1. AGENTS.md
2. .ai/index.md
3. Instructions
4. Policies
5. Skills
6. Commands
7. Context
```

---

### 1.8 Compliance

A repository is **ACS v0.1 compliant** if:

```text
- AGENTS.md exists at root
- .ai/index.md exists
- All agent contracts are inside .ai/
- No behavior depends on vendor-specific files
- Contracts are categorized using ACS taxonomy
```

---

## 2. Repository Specification (Non-Normative Reference Implementation)

### 2.1 Repository Layout

```text
agent-contracts-standard/
  AGENTS.md
  README.md
  LICENSE
  CHANGELOG.md

  .ai/
    index.md
    instructions/
      maintaining-the-spec.md
    skills/
      acs-skill-edits/
        SKILL.md
    commands/
      verify-layout.md
    policies/
      spec-integrity.md
    context/
      mcp-tool-contract.json

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
```

### 2.2 Template Requirements

#### AGENTS.md (Entry Contract)

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

#### .ai/index.md

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

### 2.3 Example Minimum

```text
AGENTS.md
.ai/
  index.md
  instructions/
    repository.md
  policies/
    safety.md
```

### 2.4 Example Full

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

The `mcp-tool-contract.json` file is an optional **documentation mirror** of the MCP tool descriptor shape from §1.2; live tools are still defined in MCP configuration.

### 2.5 Versioning

```text
v0.1 = initial composition standard
```
