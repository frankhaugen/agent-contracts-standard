# Specification integrity

**ACS type:** Policy

1. **MUST NOT** silently contradict normative text in `spec/ACS-v0.1.md` (Sections 1–10) in `templates/`, `examples/`, `README.md`, or `docs/` without updating the spec or clearly marking the content as non-authoritative illustration.
2. **MUST** update [`docs/publisher-layout-and-templates.md`](../../docs/publisher-layout-and-templates.md), `templates/`, `examples/`, and root `.ai/` when Section 5 (required structure) or Section 7 (contract definitions) changes, in the **same** change set when practical.
3. **MUST NOT** add a new root-level agent entry file (for example a second parallel to `AGENTS.md`) as a requirement for this project; `AGENTS.md` remains the sole root entry per Section 6.1 invariants.
