# Compatibility and coexistence (non-normative)

How **ACS v0.1** fits next to editors, hosts, CI, and other agent conventions in real repositories. Authoritative rules remain in [spec/ACS-v0.1.md](../spec/ACS-v0.1.md) (especially Sections 3, 6, and 9). This note is **informative** for adopters and tool authors.

---

## Summary

| Area | Compatibility | Notes |
|------|----------------|--------|
| [AGENTS.md](https://agents.md/) | **High** | ACS **requires** a root `AGENTS.md` and aligns with that community format (spec Section 3.1). |
| [Model Context Protocol](https://modelcontextprotocol.io/) (tools) | **High** | Tools are defined and run in MCP host configuration; ACS references them by name and optional documentation under `.ai/context/` (Section 3.2, Section 7.6). |
| [Agent Skills](https://agentskills.io/specification) | **High** | Skill packages under `.ai/skills/<skill-id>/` **must** conform to Agent Skills; ACS only fixes repository placement (Section 3.3, Section 7.2). |
| General `.github/` (Actions, templates, CODEOWNERS, Dependabot, etc.) | **High** | Unaffected unless paths fall under **forbidden** Copilot instruction trees (spec Section 6.3). |
| GitHub Copilot repository custom instructions | **None for compliant trees** | Paths such as `.github/copilot-instructions.md`, `.github/instructions/`, and `.github/prompts/` **must not** exist in an ACS-compliant repo. |
| Root trees `.cursor`, `.claude`, `.copilot` | **None for compliant trees** | Any file or directory with those final names **must not** appear in the version-controlled tree (Section 6.3). |
| Other vendor or editor metadata | **Partial** | Allowed **only** if not on the forbidden list, not the **sole** home of ACS-required material, and not **required** for compliance (Section 6.2, Section 6.4). |
| Runtimes, IDEs, orchestrators | **Neutral** | ACS does not define how products load files; it defines what a **repository** must contain and forbid to claim ACS compliance (Section 2). |

---

## What “compatible” means here

**Compatible** means: you can adopt ACS **without** contradicting the cited open formats (AGENTS.md, MCP, Agent Skills), and your repository can still use ordinary engineering practices (CI, issue templates, Dependabot, etc.).

**Not compatible** with **ACS v0.1 compliance** means: the normative spec **forbids** certain paths or dependence patterns. Products may still work on your machine; the **standard** is about what may be **committed** and what may be **relied on** when claiming compliance.

---

## Editors and proprietary assistants

- **Local-only configuration** (for example editor settings that never enter Git) is outside ACS: the spec governs the **version-controlled** tree.
- **Committed** vendor agent trees named `.cursor`, `.claude`, or `.copilot` cannot coexist with a claim of ACS compliance (Section 6.3).
- **Optional** vendor-specific files that are **not** forbidden and **not** the only place where instructions, policies, skills, commands, or context live are compatible with Section 6.4.

---

## CI and verification

- This publication uses `pwsh ./scripts/Verify-AcsRepo.ps1` for strict checks; other projects **may** reuse or reimplement checks. ACS does **not** require a particular language for consumer verification.
- Claiming compliance is a **documentation and layout** assertion; automated verification is **recommended** but not defined by ACS.

---

## Versioning and forks

- ACS v0.1 is a **single document** standard. Implementations **should** record which ACS version they target (for example in `AGENTS.md` or release notes).
- Forks that intentionally diverge from Sections 1–10 should **not** describe the result as “ACS v0.1 compliant” without a clear caveat.

---

## See also

- [standards-alignment.md](standards-alignment.md) — normative alignment with AGENTS.md, MCP, and Agent Skills.
- [standards-landscape.md](standards-landscape.md) — how ACS sits among existing domain standards.
- [publisher-layout-and-templates.md](publisher-layout-and-templates.md) — how **this** repository publishes the spec and samples (not part of ACS).
