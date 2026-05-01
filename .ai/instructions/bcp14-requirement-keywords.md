# BCP 14 requirement keywords in ACS

**ACS type:** Instruction

## Rules

1. In **normative** prose inside `spec/ACS-v0.1.md` Section 1, use **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** only when **bolded** (for example **MUST**). Plain English “must” or “should” in Section 1 is ambiguous and **MUST NOT** carry normative weight unless rewritten as bold BCP 14 terms.
2. Definitions of those words **MUST NOT** be paraphrased at length in ACS; Section 1.0 points to **[BCP14]** / **[RFC2119]** / **[RFC8174]** only.
3. In **informative** files (`docs/`, `README.md`, `templates/`, `examples/`), plain language is fine; do not state new requirements that contradict Section 1 of the spec.

## Cross-check

Before merging normative edits, scan Section 1 of the spec for lowercase “must” / “should” that accidentally imply requirements outside BCP 14.
