# Normative references maintenance (§1.9)

**ACS type:** Instruction

## When to edit §1.9

- An upstream specification URI or title changes in a way readers rely on.
- ACS adds a **new** incorporated standard or retires one (requires a **version bump** of ACS, not a silent edit).

## Table hygiene

- Keep **IDs** stable (**BCP14**, **RFC2119**, **RFC8174**, **AGENTS-MD**, **MCP-SPEC**, **AGENT-SKILLS**) unless doing a major ACS version where renaming is documented in `CHANGELOG.md`.
- **Notes** column: short, factual; no new unstated requirements.

## Cross-links

When §1.9 changes, update `docs/standards-alignment.md` if it duplicates IDs or URIs, skim **§1.2** for consistent use of the same IDs, and refresh `docs/standards-landscape.md` if the narrative “what is already a standard” section is affected.
