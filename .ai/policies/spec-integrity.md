# Specification integrity

**ACS type:** Policy

1. **MUST NOT** silently contradict §1 normative text in `templates/`, `examples/`, `README.md`, or `docs/` without updating the spec or clearly marking the content as non-authoritative illustration.
2. **MUST** update every dependent path listed in `spec/ACS-v0.1.md` §2.1 for this repository when §1.4 (required structure) or §1.6 (contract definitions) changes, in the **same** change set when practical.
3. **MUST NOT** add a new root-level agent entry file (for example a second parallel to `AGENTS.md`) as a requirement for this project; `AGENTS.md` remains the sole root entry per §1.5 invariants.
