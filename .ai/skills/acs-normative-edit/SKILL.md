---
name: acs-normative-edit
description: Edits normative Sections 1–10 of spec/ACS-v0.1.md. Use for BCP 14 keyword fixes, compliance wording, Section 10 reference table updates, or new MUST/SHOULD rules. Triggers on normative spec, BCP14, compliance, Section 10, or RFC 2119.
license: MIT
---

# ACS normative edit

## Preconditions

0. **Authorization:** A human maintainer has given **explicit written instruction** to change `spec/ACS-v0.1.md` (issue or PR). If missing, **stop** — see [spec-file-human-authorization.md](../../policies/spec-file-human-authorization.md).

Read [bcp14-requirement-keywords.md](../../instructions/bcp14-requirement-keywords.md) and [normative-vs-informative.md](../../instructions/normative-vs-informative.md).

## Steps

1. Identify every normative subsection touched (Sections 1–10); list dependent paths (`templates/`, `examples/`, root `.ai/`).
2. Apply edits using **bold** BCP 14 keywords only for normative force in Sections 1–10.
3. Update **Section 10** if any normative reference ID or URI changes; keep Section 3 IDs in sync.
4. Update `CHANGELOG.md` if compliance meaning changes.
5. Run `pwsh ./scripts/Verify-AcsRepo.ps1`.

## Output

Short summary of spec deltas and files updated for parity.
