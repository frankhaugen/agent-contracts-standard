# Agent Contracts Standard (ACS) v0.1

| Field | Value |
|--------|--------|
| Short name | ACS |
| Version | 0.1 |
| Document status | Published |
| Canonical source | Implementations distributing this specification **SHOULD** record a stable URI or equivalent provenance for this file; ACS does not require a particular hosting repository layout. |

## Copyright

Copyright © 2026 Frank R. Haugen and contributors. This specification is distributed under the same license as the accompanying repository (see the `LICENSE` file). Copies must retain copyright and permission notices as required by that license.

## Abstract

The Agent Contracts Standard (ACS) defines a **vendor-neutral** repository layout and taxonomy for machine-oriented agent contracts: a root `AGENTS.md` entry contract, a canonical `.ai/` subtree (instructions, policies, skills, commands, context), and a **resolution order** for those contracts. ACS **incorporates by reference** requirement notation from IETF BCP 14; it **aligns with or incorporates** the community **AGENTS.md** entry format, the **Model Context Protocol (MCP)** for tools, and the **Agent Skills** packaging rules for skills. ACS does **not** define runtimes, orchestrators, or vendor-specific agent products.

## Status of this document

The entire specification consists of **§1 Standard (Normative Specification)** below. There is **no** §2 in this document. Publisher-specific trees, sample repositories, template prose, and hosting layout **MUST NOT** appear in this file; they belong in separate **non-normative** material maintained outside the standard.

---

## 1. Standard (Normative Specification)

### 1.0 Conformance terminology

ACS uses the requirement levels **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** only when they appear in **bold** in this document. Those words are interpreted exactly as specified for Internet standards in **[BCP14]** (which comprises **[RFC2119]** as modified by **[RFC8174]**). This document **does not redefine** those terms; the authoritative definitions remain solely in the cited IETF documents. Implementations claiming ACS compliance **MUST** interpret bold keywords accordingly.

### 1.1 Scope

**Defines:**

- Contract taxonomy
- Required repository structure
- File roles and placement
- Resolution order
- Vendor neutrality constraints (§1.5)

**Does not define:**

- Runtime/orchestration
- Execution engines
- Product-specific agent runtimes (except where §1.5 forbids **depending** on their repository paths for compliance)

---

### 1.2 External standards alignment and incorporation

This subsection states **how** ACS relates to other specifications. **§1.9** lists **normative references** (stable identifiers and URIs). Where ACS quotes a small structural example (for example JSON field names for MCP tools), the **authoritative definition** remains in the referenced specification.

#### Entry contract ([AGENTS-MD])

- **MUST** align with the **AGENTS.md** convention: a Markdown file named `AGENTS.md` at the repository root, used as the agent entry contract as described at [https://agents.md/](https://agents.md/).

ACS uses `AGENTS.md` as the **only** required root-level agent entrypoint. ACS adds repository-local rules (for example discovery of `.ai/`); it does not replace the AGENTS.md format’s own guidance on content.

#### Tools / execution ([MCP-SPEC])

- **MUST** align with the **Model Context Protocol** for executable tools and tool metadata as defined in **[MCP-SPEC]**.

The following JSON object illustrates **only** the field names ACS relies on for interchange documentation; **full** tool schemas, transport, and security properties are defined by MCP, not reproduced here:

```json
{
  "name": "string",
  "description": "string",
  "input_schema": {}
}
```

#### Skills ([AGENT-SKILLS])

- **MUST** conform to **[AGENT-SKILLS]** for every skill package under `.ai/skills/` (directory layout, `SKILL.md` front matter, naming rules, and optional subdirectories).

ACS defines **repository-local placement** under `.ai/skills/<skill-id>/`; each such package **MUST** include `SKILL.md` with required YAML (`name`, `description`) and **MUST** satisfy all constraints imposed by **[AGENT-SKILLS]** (including `name` matching the parent directory). ACS does not add conflicting rules on top of Agent Skills for that tree.

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

Each skill under `skills/` **MUST** follow the directory and file rules in **[AGENT-SKILLS]** (`SKILL.md` plus optional `scripts/`, `references/`, and `assets/` only as defined there).

---

### 1.5 Invariants and vendor neutrality

#### General invariants

The following **invariants** **MUST** hold for any repository claiming ACS v0.1 compliance:

1. **Root entrypoint.** `AGENTS.md` at the repository root is the **only** root-level contract file **required** by ACS as the agent entry contract (§1.2, §1.4).
2. **Complete subtree.** Every file whose **role** under ACS is instruction, policy, skill, command, or context (§1.3, §1.6) **MUST** lie under `.ai/` as prescribed by §1.4 and §1.6 (including **[AGENT-SKILLS]** constraints inside `.ai/skills/<skill-id>/`).
3. **Discoverability.** All such material **MUST** be discoverable from `AGENTS.md` alone (by its content or by pointers that lead to `.ai/index.md` and then to the relevant `.ai/` locations).
4. **Vendor neutrality.** The repository **MUST** satisfy the **Vendor-specific artifacts**, **Forbidden paths**, and **Normative prohibitions** portions of §1.5.

#### Vendor-specific artifacts

For ACS, a **vendor-specific agent artifact** is a **file or directory path** in the repository (including committed configuration files) that **all** of the following characterize:

1. A **specific product, editor, hosting service, or proprietary agent platform** documents that path (or a class of paths uniquely tied to that product) as **the** or **primary** location from which **that product** loads repository-scoped agent instructions, rules, policies, skills, or equivalent behavioral contracts **when operating on this repository**.
2. The path is **not** `AGENTS.md`; is **not** inside the `.ai/` tree as required by §1.4; and is **not** solely a path whose use is **mandated** by **[AGENTS-MD]**, **[AGENT-SKILLS]** (for content inside `.ai/skills/<skill-id>/`), or **[MCP-SPEC]**.

*Informative notes:* Paths standardized by **[MCP-SPEC]** or **[AGENT-SKILLS]** are **not** vendor-specific **solely** because a vendor implements those standards. Optional product-only files or directories that **do not** satisfy both bullets above and are **not** listed under **Forbidden paths** (below) are **not** vendor-specific agent artifacts under this definition. ACS regulates **dependence** for compliance and, separately, bans certain paths outright.

#### Forbidden paths

The following paths **MUST NOT** exist anywhere in the **version-controlled** repository tree (case-sensitive path components as shown). This is an **absolute** prohibition: compliance **MUST NOT** be claimed if any matching file or directory is present.

**Proprietary agent configuration names** — a file or directory whose final path component is exactly one of the following **MUST NOT** exist at **any** depth under the repository root (version-controlled tree; VCS metadata directories such as `.git` **MAY** be ignored when checking):

- `.copilot`
- `.claude`
- `.cursor`

*Informative:* These names commonly denote proprietary coding-agent or editor configuration roots outside ACS.

**GitHub Copilot infrastructure under `.github/`** — **MUST NOT** exist:

- File `.github/copilot-instructions.md`
- Directory `.github/copilot/` (any path under it)
- Directory `.github/instructions/` (any path under it; used by GitHub Copilot for path-scoped `*.instructions.md` custom instructions)
- Directory `.github/prompts/` (any path under it; used by GitHub Copilot repository prompt files)

*Informative:* Other material under `.github/` (for example Actions workflows, issue templates, `CODEOWNERS`, Dependabot configuration) is **not** restricted by this subsection **unless** it is part of a forbidden path above.

#### Normative prohibitions

A repository **MUST NOT** treat any **vendor-specific agent artifact** as **required** to satisfy §1.4, to populate the taxonomy in §1.3, to discover contracts from `AGENTS.md`, to apply §1.7, or to claim **ACS v0.1 compliance** under §1.8.

A repository **MAY** include vendor-specific agent artifacts for optional tooling or ergonomics **only** if they are **not** listed under **Forbidden paths** in this section. If such artifacts exist, they **MUST NOT** be the **sole** place where material required by ACS (entry contract, `.ai/index.md`, or any instruction, policy, skill, command, or context contract) actually lives. *Equivalently:* if every **non-forbidden** vendor-specific agent artifact were removed and the remaining tree did not **fully** expose the ACS-defined roles from `AGENTS.md` and `.ai/` alone, the repository **MUST NOT** be considered ACS v0.1 compliant.

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

Reusable capability definition. Requirements for `SKILL.md`, front matter, and optional directories are **exclusively** those of **[AGENT-SKILLS]**; `<skill-id>` **MUST** match the `name` field as required there.

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

Executable operation. Declare tools in MCP server configuration; reference them from instructions, context, or commands using stable tool names. The minimal JSON field set cited in §1.2 is informative shorthand for **[MCP-SPEC]**; repository-local JSON or tables **MAY** mirror it for documentation outside this specification.

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

A repository is **ACS v0.1 compliant** if **all** of the following hold:

1. `AGENTS.md` exists at the repository root.
2. `.ai/index.md` exists.
3. Every ACS-classified contract (§1.3) is located under `.ai/` as required by §1.4 and §1.6 (with skills conforming to **[AGENT-SKILLS]**), except the root entry contract `AGENTS.md`.
4. §1.5 (general invariants, definition of vendor-specific artifacts, **Forbidden paths**, and normative prohibitions) is satisfied.
5. Contracts are categorized using the ACS taxonomy (§1.3).

---

### 1.9 Normative references

The following references are **normative**: they are incorporated into ACS by citation, and compliance may depend on them. Where a reference has no version pinned below, implementers **SHOULD** use the latest stable revision available at the given URI and **MUST** resolve conflicts in favor of the referenced specification when ACS is silent.

| ID | Reference | Notes |
|----|-----------|--------|
| **BCP14** | IETF, *Best Current Practice 14* (requirement levels), RFC Editor, [https://www.rfc-editor.org/info/bcp14](https://www.rfc-editor.org/info/bcp14). | Bundles **RFC2119** and **RFC8174**; defines **MUST**, **SHOULD**, **MAY**, etc., as used in bold in this document. |
| **RFC2119** | Bradner, S., “Key words for use in RFCs to Indicate Requirement Levels,” RFC 2119, March 1997, [https://www.rfc-editor.org/rfc/rfc2119](https://www.rfc-editor.org/rfc/rfc2119). | Component of BCP 14. |
| **RFC8174** | Leiba, B., “Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words,” RFC 8174, May 2017, [https://www.rfc-editor.org/rfc/rfc8174](https://www.rfc-editor.org/rfc/rfc8174). | Component of BCP 14. |
| **AGENTS-MD** | *AGENTS.md* community specification, Agentic AI Foundation / ecosystem contributors, [https://agents.md/](https://agents.md/). | Root entry contract format ACS **MUST** align with (§1.2). |
| **MCP-SPEC** | *Model Context Protocol* specification, [https://modelcontextprotocol.io/](https://modelcontextprotocol.io/) (specification index and linked normative text). | Tools and protocol semantics ACS **MUST** align with (§1.2). |
| **AGENT-SKILLS** | *Agent Skills — Specification*, Agent Skills open standard, [https://agentskills.io/specification](https://agentskills.io/specification). | Skill packages under `.ai/skills/` **MUST** conform (§1.2, §1.6). |

### 1.10 Acknowledgments

ACS adopts **requirement notation** from the IETF through **[BCP14]** without restating RFC 2119 prose in full. The **AGENTS.md** name and practice are a **community convention** documented at **[AGENTS-MD]** (stewardship and history are described on that site). **Agent Skills** packaging rules are due to the **Agent Skills** open standard and community ([**AGENT-SKILLS**]). **MCP** is defined by the Model Context Protocol project ([**MCP-SPEC**]). ACS is independent work that **profiles** those specifications to a single repository layout; it does not speak for the cited organizations.
