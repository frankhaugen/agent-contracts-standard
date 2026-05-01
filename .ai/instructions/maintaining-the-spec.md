# Maintaining the ACS specification

**ACS type:** Instruction

This repository is the **reference publication** for ACS v0.1. Treat **`spec/ACS-v0.1.md`** as the **entire** standard: normative requirements are in **Sections 1 through 10**; **Section 11** is informative only. Publisher layout, templates, and sample trees **MUST NOT** live in the spec file; they live in [`docs/publisher-layout-and-templates.md`](../../docs/publisher-layout-and-templates.md), `templates/`, and `examples/` and **must** stay consistent with the normative sections of the spec.

**Hard gate:** Do **not** edit `spec/ACS-v0.1.md` without human maintainer authorization. Read [spec-file-human-authorization.md](../policies/spec-file-human-authorization.md) and [spec-change-gate.md](spec-change-gate.md) first.

## Normative spec work

- Prefer **small, reviewable** edits; one conceptual change per commit when possible.
- Requirement keywords (**MUST**, **SHOULD**, **MAY**, …) appear **only in bold** per [BCP 14](https://www.rfc-editor.org/info/bcp14) — see [bcp14-requirement-keywords.md](bcp14-requirement-keywords.md).
- **Section 10** tables are authoritative for identifiers (**BCP14**, **AGENTS-MD**, **MCP-SPEC**, **AGENT-SKILLS**). Do not invent alternate IDs without updating Section 3 and Section 10 together — see [normative-references-maintenance.md](normative-references-maintenance.md).
- Never move normative requirements into `docs/` or `README.md` alone; if readers need a rule, it belongs in the spec or must clearly defer to it — see [normative-vs-informative.md](normative-vs-informative.md).

## Publisher material and templates

- Any change to required paths, skill packaging, or resolution order in the normative spec **MUST** be reflected in `docs/publisher-layout-and-templates.md` (if it documents this repo), `templates/`, `examples/`, root `.ai/`, and CI verification in the same change set when practical — see [templates-examples-parity.md](templates-examples-parity.md).

## Contribution process

Human workflow and branching: [CONTRIBUTING.md](../../CONTRIBUTING.md).
