# Agent Contracts Standard (ACS) v0.1

| Field | Value |
|--------|--------|
| Short name | ACS |
| Version | 0.1 |
| Document status | Published |
| Keywords | agent contracts; repository layout; AGENTS.md; machine-readable policy; vendor neutrality |
| Canonical source | Implementations distributing this specification **SHOULD** record a stable URI or equivalent provenance for this file; ACS does not require a particular hosting repository layout. |

## Copyright

Copyright © 2026 Frank R. Haugen and contributors. This specification is distributed under the same license as the accompanying repository (see the `LICENSE` file). Copies must retain copyright and permission notices as required by that license.

## Abstract

The Agent Contracts Standard (ACS) defines a **vendor-neutral** repository layout and taxonomy for machine-oriented agent contracts: a root `AGENTS.md` entry contract, a canonical `.ai/` subtree (instructions, policies, skills, commands, context), and a **resolution order** for those contracts. ACS **incorporates by reference** requirement notation from IETF BCP 14; it **aligns with or incorporates** the community **AGENTS.md** entry format, the **Model Context Protocol (MCP)** for tools, and the **Agent Skills** packaging rules for skills. ACS does **not** define runtimes, orchestrators, or vendor-specific agent products.

## Document conventions

The following conventions apply throughout this document:

- **Requirement keywords.** The words **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** (in **bold**) are interpreted as described in Section 1 and in **[BCP14]**.
- **Cross-references.** “Section *n*” refers to a numbered top-level section (for example Section 6). “Section *n*.*m*” refers to a subsection (for example Section 6.3).
- **Paths and filenames.** Pathnames use a forward slash (`/`) as a separator. Names in angle brackets (for example `<skill-id>`) denote placeholders, not literal filenames.
- **Repository root.** The **repository root** is the top-level directory of a single version-controlled software project (the root of the working tree for that project).
- **Informative text.** Paragraphs introduced with *Informative* (or placed in a blockquote starting with **Informative**) do not state new requirements; they explain intent, give examples, or cite non-normative context.

## Table of contents

- [Section 1 — Conformance terminology](#1-conformance-terminology)
- [Section 2 — Scope](#2-scope)
- [Section 3 — External standards alignment and incorporation](#3-external-standards-alignment-and-incorporation)
- [Section 4 — Contract taxonomy](#4-contract-taxonomy)
- [Section 5 — Required structure](#5-required-structure)
- [Section 6 — Invariants and vendor neutrality](#6-invariants-and-vendor-neutrality)
- [Section 7 — Contract definitions](#7-contract-definitions)
- [Section 8 — Resolution order](#8-resolution-order)
- [Section 9 — Compliance](#9-compliance)
- [Section 10 — Normative references](#10-normative-references)
- [Section 11 — Acknowledgments](#11-acknowledgments)

## Status of this document

This file is the **complete** normative standard for ACS version 0.1. Normative requirements are in **Sections 1 through 10**. **Section 11** is **informative** only. Repository templates, sample trees, publisher hosting layout, and similar material **MUST NOT** appear in this document; they belong in separate **non-normative** publications maintained outside this specification.

---

## 1. Conformance terminology

ACS uses the requirement levels **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** only when they appear in **bold** in this document. Those words are interpreted exactly as specified for Internet standards in **[BCP14]** (which comprises **[RFC2119]** as modified by **[RFC8174]**). This document **does not redefine** those terms; the authoritative definitions remain solely in the cited IETF documents. Implementations claiming ACS compliance **MUST** interpret bold keywords accordingly.

## 2. Scope

**Defines:**

- Contract taxonomy
- Required repository structure
- File roles and placement
- Resolution order
- Vendor neutrality constraints (Section 6)

**Does not define:**

- Runtime or orchestration
- Execution engines
- Product-specific agent runtimes (except where Section 6 forbids **depending** on their repository paths for compliance)

## 3. External standards alignment and incorporation

This section states **how** ACS relates to other specifications. Section 10 lists **normative references** (stable identifiers and URIs). Where ACS quotes a small structural example (for example JSON field names for MCP tools), the **authoritative definition** remains in the referenced specification.

### 3.1 Entry contract ([AGENTS-MD])

- **MUST** align with the **AGENTS.md** convention: a Markdown file named `AGENTS.md` at the repository root, used as the agent entry contract as described at [https://agents.md/](https://agents.md/).

ACS uses `AGENTS.md` as the **only** required root-level agent entrypoint. ACS adds repository-local rules (for example discovery of `.ai/`); it does not replace the AGENTS.md format’s own guidance on content.

### 3.2 Tools and execution ([MCP-SPEC])

- **MUST** align with the **Model Context Protocol** for executable tools and tool metadata as defined in **[MCP-SPEC]**.

The following JSON object illustrates **only** the field names ACS relies on for interchange documentation; **full** tool schemas, transport, and security properties are defined by MCP, not reproduced here:

```json
{
  "name": "string",
  "description": "string",
  "input_schema": {}
}
```

### 3.3 Skills ([AGENT-SKILLS])

- **MUST** conform to **[AGENT-SKILLS]** for every skill package under `.ai/skills/` (directory layout, `SKILL.md` front matter, naming rules, and optional subdirectories).

ACS defines **repository-local placement** under `.ai/skills/<skill-id>/`; each such package **MUST** include `SKILL.md` with required YAML (`name`, `description`) and **MUST** satisfy all constraints imposed by **[AGENT-SKILLS]** (including `name` matching the parent directory). ACS does not add conflicting rules on top of Agent Skills for that tree.

## 4. Contract taxonomy

| Contract type | Role |
|---------------|------|
| Entry Contract | `AGENTS.md` |
| Instruction | Persistent rules |
| Skill | Reusable capability |
| Command | Named workflow |
| Tool | MCP-compatible executable |
| Policy | Hard constraint |
| Context | Structured system data |

## 5. Required structure

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

Each skill under `skills/` **MUST** follow the directory and file rules in **[AGENT-SKILLS]** (`SKILL.md` plus optional `scripts/`, `references/`, and `assets/` only as defined there).

## 6. Invariants and vendor neutrality

### 6.1 General invariants

The following **invariants** **MUST** hold for any repository claiming ACS v0.1 compliance:

1. **Root entrypoint.** `AGENTS.md` at the repository root is the **only** root-level contract file **required** by ACS as the agent entry contract (Section 3, Section 5).
2. **Complete subtree.** Every file whose **role** under ACS is instruction, policy, skill, command, or context (Section 4, Section 7) **MUST** lie under `.ai/` as prescribed by Section 5 and Section 7 (including **[AGENT-SKILLS]** constraints inside `.ai/skills/<skill-id>/`).
3. **Discoverability.** All such material **MUST** be discoverable from `AGENTS.md` alone (by its content or by pointers that lead to `.ai/index.md` and then to the relevant `.ai/` locations).
4. **Vendor neutrality.** The repository **MUST** satisfy Section 6.2 (*Vendor-specific artifacts*), Section 6.3 (*Forbidden paths*), and Section 6.4 (*Normative prohibitions*).

### 6.2 Vendor-specific artifacts

For ACS, a **vendor-specific agent artifact** is a **file or directory path** in the repository (including committed configuration files) that **all** of the following characterize:

1. A **specific product, editor, hosting service, or proprietary agent platform** documents that path (or a class of paths uniquely tied to that product) as **the** or **primary** location from which **that product** loads repository-scoped agent instructions, rules, policies, skills, or equivalent behavioral contracts **when operating on this repository**.
2. The path is **not** `AGENTS.md`; is **not** inside the `.ai/` tree as required by Section 5; and is **not** solely a path whose use is **mandated** by **[AGENTS-MD]**, **[AGENT-SKILLS]** (for content inside `.ai/skills/<skill-id>/`), or **[MCP-SPEC]**.

> *Informative:* Paths standardized by **[MCP-SPEC]** or **[AGENT-SKILLS]** are **not** vendor-specific **solely** because a vendor implements those standards. Optional product-only files or directories that **do not** satisfy both bullets above and are **not** listed under *Forbidden paths* (Section 6.3) are **not** vendor-specific agent artifacts under this definition. ACS regulates **dependence** for compliance and, separately, bans certain paths outright.

### 6.3 Forbidden paths

The following paths **MUST NOT** exist anywhere in the **version-controlled** repository tree (case-sensitive path components as shown). This is an **absolute** prohibition: compliance **MUST NOT** be claimed if any matching file or directory is present.

**Proprietary agent configuration names.** A file or directory whose final path component is exactly one of the following **MUST NOT** exist at **any** depth under the repository root (version-controlled tree; VCS metadata directories such as `.git` **MAY** be ignored when checking):

- `.copilot`
- `.claude`
- `.cursor`

> *Informative:* These names commonly denote proprietary coding-agent or editor configuration roots outside ACS.

**GitHub Copilot infrastructure under `.github/`.** The following **MUST NOT** exist:

- File `.github/copilot-instructions.md`
- Directory `.github/copilot/` (any path under it)
- Directory `.github/instructions/` (any path under it; used by GitHub Copilot for path-scoped `*.instructions.md` custom instructions)
- Directory `.github/prompts/` (any path under it; used by GitHub Copilot repository prompt files)

> *Informative:* Other material under `.github/` (for example Actions workflows, issue templates, `CODEOWNERS`, Dependabot configuration) is **not** restricted by this subsection **unless** it is part of a forbidden path above.

### 6.4 Normative prohibitions

A repository **MUST NOT** treat any **vendor-specific agent artifact** as **required** to satisfy Section 5, to populate the taxonomy in Section 4, to discover contracts from `AGENTS.md`, to apply Section 8, or to claim **ACS v0.1 compliance** under Section 9.

A repository **MAY** include vendor-specific agent artifacts for optional tooling or ergonomics **only** if they are **not** listed under *Forbidden paths* (Section 6.3). If such artifacts exist, they **MUST NOT** be the **sole** place where material required by ACS (entry contract, `.ai/index.md`, or any instruction, policy, skill, command, or context contract) actually lives. *Equivalently:* if every **non-forbidden** vendor-specific agent artifact were removed and the remaining tree did not **fully** expose the ACS-defined roles from `AGENTS.md` and `.ai/` alone, the repository **MUST NOT** be considered ACS v0.1 compliant.

## 7. Contract definitions

### 7.1 Instruction

```text
Location: .ai/instructions/*.md
Scope: global
```

Persistent behavioral rules.

### 7.2 Skill

```text
Location: .ai/skills/<skill-id>/SKILL.md (and optional sibling files per Agent Skills)
Scope: task-level
```

Reusable capability definition. Requirements for `SKILL.md`, front matter, and optional directories are **exclusively** those of **[AGENT-SKILLS]**; `<skill-id>` **MUST** match the `name` field as required there.

### 7.3 Command

```text
Location: .ai/commands/*.md
Scope: invoked workflow
```

Named execution process.

### 7.4 Policy

```text
Location: .ai/policies/*.md
Scope: always enforced
```

Hard constraint.

### 7.5 Context

```text
Location: .ai/context/*
Scope: read-only
```

Structured data.

### 7.6 Tool

```text
Defined externally (MCP)
Referenced within ACS
```

Executable operation. Declare tools in MCP server configuration; reference them from instructions, context, or commands using stable tool names. The minimal JSON field set cited in Section 3 is informative shorthand for **[MCP-SPEC]**; repository-local JSON or tables **MAY** mirror it for documentation outside this specification.

## 8. Resolution order

```text
1. AGENTS.md
2. .ai/index.md
3. Instructions
4. Policies
5. Skills
6. Commands
7. Context
```

## 9. Compliance

A repository is **ACS v0.1 compliant** if **all** of the following hold:

1. `AGENTS.md` exists at the repository root.
2. `.ai/index.md` exists.
3. Every ACS-classified contract (Section 4) is located under `.ai/` as required by Section 5 and Section 7 (with skills conforming to **[AGENT-SKILLS]**), except the root entry contract `AGENTS.md`.
4. Section 6 (general invariants, definition of vendor-specific artifacts, *Forbidden paths*, and normative prohibitions) is satisfied.
5. Contracts are categorized using the ACS taxonomy (Section 4).

## 10. Normative references

The following references are **normative**: they are incorporated into ACS by citation, and compliance may depend on them. Where a reference has no version pinned below, implementers **SHOULD** use the latest stable revision available at the given URI and **MUST** resolve conflicts in favor of the referenced specification when ACS is silent.

| ID | Reference | Notes |
|----|-----------|--------|
| **BCP14** | IETF, *Best Current Practice 14* (requirement levels), RFC Editor, [https://www.rfc-editor.org/info/bcp14](https://www.rfc-editor.org/info/bcp14). | Bundles **RFC2119** and **RFC8174**; defines **MUST**, **SHOULD**, **MAY**, etc., as used in bold in this document. |
| **RFC2119** | Bradner, S., “Key words for use in RFCs to Indicate Requirement Levels,” RFC 2119, March 1997, [https://www.rfc-editor.org/rfc/rfc2119](https://www.rfc-editor.org/rfc/rfc2119). | Component of BCP 14. |
| **RFC8174** | Leiba, B., “Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words,” RFC 8174, May 2017, [https://www.rfc-editor.org/rfc/rfc8174](https://www.rfc-editor.org/rfc/rfc8174). | Component of BCP 14. |
| **AGENTS-MD** | *AGENTS.md* community specification, Agentic AI Foundation / ecosystem contributors, [https://agents.md/](https://agents.md/). | Root entry contract format ACS **MUST** align with (Section 3). |
| **MCP-SPEC** | *Model Context Protocol* specification, [https://modelcontextprotocol.io/](https://modelcontextprotocol.io/) (specification index and linked normative text). | Tools and protocol semantics ACS **MUST** align with (Section 3). |
| **AGENT-SKILLS** | *Agent Skills — Specification*, Agent Skills open standard, [https://agentskills.io/specification](https://agentskills.io/specification). | Skill packages under `.ai/skills/` **MUST** conform (Section 3, Section 7). |

## 11. Acknowledgments

> *Informative:* This section does not specify requirements.

ACS adopts **requirement notation** from the IETF through **[BCP14]** without restating RFC 2119 prose in full. The **AGENTS.md** name and practice are a **community convention** documented at **[AGENTS-MD]** (stewardship and history are described on that site). **Agent Skills** packaging rules are due to the **Agent Skills** open standard and community ([**AGENT-SKILLS**]). **MCP** is defined by the Model Context Protocol project ([**MCP-SPEC**]). ACS is independent work that **profiles** those specifications to a single repository layout; it does not speak for the cited organizations.
