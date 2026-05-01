# Normative versus informative content

**ACS type:** Instruction

| Layer | Location | Force |
|-------|-----------|--------|
| Normative | `spec/ACS-v0.1.md` (Sections 1–10; Section 11 is informative only) | Defines ACS compliance |
| Informative | `docs/`, `README.md`, `templates/`, `examples/` (and other publisher material **outside** the spec file) | Illustration and onboarding only |

## Rules

1. If a sentence in informative material reads like a new **requirement** for ACS compliance, either **move** it into the normative spec or **rephrase** it as non-binding guidance (“for example…”, “one approach…”).
2. Templates and examples **MUST NOT** introduce directory names or taxonomies that contradict Sections 5–8 without a matching spec update.
3. Root `.ai/` in **this** repository follows the same taxonomy as any ACS repo; it is **not** a second normative spec—it operationalizes work on the standard.
