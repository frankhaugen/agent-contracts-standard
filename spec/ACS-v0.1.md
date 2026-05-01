# Agent Contracts Standard (ACS) v0.1

This document defines ACS v0.1. **Section 1** is normative. **Section 2** is non-normative (reference implementation and repository layout).

---

## 1. Standard (Normative Specification)

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

- **SHOULD** align with [Agent Skills](https://agentskills.io/).

ACS defines repository-local representation only.

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
  commands/
  policies/
  context/
```

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
Location: .ai/skills/*.md
Scope: task-level
```

Reusable capability definition.

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

Executable operation.

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
  README.md
  LICENSE
  CHANGELOG.md

  spec/
    ACS-v0.1.md

  templates/
    AGENTS.md
    .ai/
      index.md
      instructions/
        example.md
      skills/
        example.md
      commands/
        example.md
      policies/
        example.md
      context/
        example.md

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
        skills/
          write-tests.md
        commands/
          review-pr.md
        policies/
          generated-files.md
        context/
          repo-map.md

  docs/
    rationale.md
    standards-alignment.md
```

### 2.2 Template Requirements

#### AGENTS.md (Entry Contract)

Aligned with AGENTS.md:

```md
# Agent Instructions

This repository uses `.ai/` as the canonical agent contract.

## Required Reads

1. `.ai/index.md`
2. `.ai/instructions/`
3. `.ai/policies/`

## Rules

- Follow instructions before making changes
- Enforce policies at all times
- Use skills when applicable
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
    write-tests.md
  commands/
    review-pr.md
  policies/
    generated-files.md
  context/
    repo-map.md
```

### 2.5 Versioning

```text
v0.1 = initial composition standard
```
