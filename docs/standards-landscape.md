# Standards landscape (non-normative)

How **Agent Contracts Standard (ACS) v0.1** sits among specifications that already exist in the “agents in repositories” space. Binding definitions, normative references, and short alignment tables are in [spec/ACS-v0.1.md](../spec/ACS-v0.1.md) (especially Sections 3 and 10) and in [standards-alignment.md](standards-alignment.md). This note is **explanatory** only.

---

## Specifications ACS explicitly adopts

ACS does not redefine these; it **cites** them and may **profile** them (for example by fixing directory placement in a repo).

| Layer | Specification | Role |
|--------|----------------|------|
| Requirement language | IETF **BCP 14** ([RFC 2119](https://www.rfc-editor.org/rfc/rfc2119), [RFC 8174](https://www.rfc-editor.org/rfc/rfc8174)) | Same **MUST** / **SHOULD** / **MAY** vocabulary as Internet standards. |
| Root entry contract | [**AGENTS.md**](https://agents.md/) ([AGENTS-MD] in the spec) | Root `AGENTS.md` as the agent entry contract; ACS adds discovery of `.ai/`, not a competing entry format. |
| Executable tools | [**Model Context Protocol**](https://modelcontextprotocol.io/) ([MCP-SPEC]) | Tool shape, transport, and security live in MCP; ACS aligns and references tools from instructions, context, or commands by name. |
| Skill packages | [**Agent Skills**](https://agentskills.io/specification) ([AGENT-SKILLS]) | Every tree under `.ai/skills/<skill-id>/` **MUST** satisfy Agent Skills (`SKILL.md`, front matter, directory naming, optional subfolders). |

Together, these are the parts of the domain that are **already** formal or community specifications ACS **depends on**.

---

## Common practice that is not ACS-normative

Many teams rely on **product- or editor-specific** files (rules, proprietary prompts, IDE-only paths). ACS v0.1 still **forbids** specific paths outright (for example any `.cursor`/`.copilot`/`.claude` path segment and GitHub Copilot instruction trees under `.github/`—see spec Section 6.3 *Forbidden paths*). For paths **not** so forbidden, ACS **does not** require vendor-specific filenames for compliance; see Sections 6 and 9 for definitions, **Forbidden paths**, and dependence rules.

Other initiatives (for example agent-to-agent protocols or registry formats) may mature into standards. **ACS v0.1** does not incorporate them by reference; its normative perimeter is the reference table in the spec Section 10.

---

## What ACS adds on top

Where ACS is **new specification work** (narrow, on purpose) is mainly:

- A **contract taxonomy** (entry, instruction, skill, command, policy, context, tool) with distinct roles.
- A **required repository layout**: `AGENTS.md`, `.ai/index.md`, and the named folders under `.ai/`.
- A **resolution order** (spec Section 8) for how to think about precedence across those types.
- **Compliance** criteria (spec Section 9): structure, categorization, discoverability from `AGENTS.md`, satisfaction of Section 6 vendor neutrality (including **MUST NOT** require vendor-specific agent artifacts for compliance), and **MUST NOT** include Section 6.3 *Forbidden paths*.

In short: **ACS profiles AGENTS.md, MCP, and Agent Skills into one vendor-neutral tree** and standardizes **layout, taxonomy, and precedence**—concerns those upstream documents do not fully pin down for a single repository contract root.

---

## See also

- [standards-alignment.md](standards-alignment.md) — compact “how ACS relates” summary.
- [rationale.md](rationale.md) — why ACS exists and what it avoids.
- [publisher-layout-and-templates.md](publisher-layout-and-templates.md) — how **this** repository ships spec, templates, and examples (not part of the ACS normative document).
