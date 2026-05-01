# BCP 14 requirement keywords in ACS

**ACS type:** Instruction

## Rules

1. In **normative** prose inside `spec/ACS-v0.1.md` **Sections 1 through 10**, use **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** only when **bolded** (for example **MUST**). Plain English “must” or “should” in those sections is ambiguous and **MUST NOT** carry normative weight unless rewritten as bold BCP 14 terms.
2. Definitions of those words **MUST NOT** be paraphrased at length in ACS; Section 1 points to **[BCP14]** / **[RFC2119]** / **[RFC8174]** only.
3. In **informative** files (`docs/`, `README.md`, `templates/`, `examples/`), plain language is fine; do not state new requirements that contradict the normative spec.

## Cross-check

Before merging normative edits, scan **Sections 1–10** of the spec for lowercase “must” / “should” that accidentally imply requirements outside BCP 14.
