# Maintaining the ACS specification

**ACS type:** Instruction

This repository is the **reference publication** for ACS v0.1. Treat **§1** of `spec/ACS-v0.1.md` as law for the standard; treat **§2** as illustrative layout that **must** stay consistent with §1 unless explicitly labeled otherwise.

## Normative (§1) work

- Prefer **small, reviewable** edits; one conceptual change per commit when possible.
- Requirement keywords (**MUST**, **SHOULD**, **MAY**, …) appear **only in bold** per [BCP 14](https://www.rfc-editor.org/info/bcp14) — see [bcp14-requirement-keywords.md](bcp14-requirement-keywords.md).
- **§1.9** tables are authoritative for identifiers (**BCP14**, **AGENTS-MD**, **MCP-SPEC**, **AGENT-SKILLS**). Do not invent alternate IDs without updating §1.2 and §1.9 together — see [normative-references-maintenance.md](normative-references-maintenance.md).
- Never move normative requirements into `docs/` or `README.md` alone; if readers need a rule, it belongs in §1 or must clearly defer to §1 — see [normative-vs-informative.md](normative-vs-informative.md).

## Non-normative (§2) and templates

- Any change to required paths, skill packaging, or resolution order in §1 **MUST** be reflected in `templates/`, `examples/`, root `.ai/`, and CI verification in the same change set when practical — see [templates-examples-parity.md](templates-examples-parity.md).

## Contribution process

Human workflow and branching: [CONTRIBUTING.md](../../CONTRIBUTING.md).
