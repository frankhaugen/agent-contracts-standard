# Normative versus informative content

**ACS type:** Instruction

| Layer | Location | Force |
|-------|-----------|--------|
| Normative | `spec/ACS-v0.1.md` (§1 through §1.10 only; there is no §2) | Defines ACS compliance |
| Informative | `docs/`, `README.md`, `templates/`, `examples/` (and other publisher material **outside** the spec file) | Illustration and onboarding only |

## Rules

1. If a sentence in informative material reads like a new **requirement** for ACS compliance, either **move** it into §1 or **rephrase** it as non-binding guidance (“for example…”, “one approach…”).
2. Templates and examples **MUST NOT** introduce directory names or taxonomies that contradict §1.4–§1.7 without a matching §1 update.
3. Root `.ai/` in **this** repository follows the same taxonomy as any ACS repo; it is **not** a second normative spec—it operationalizes work on the standard.
