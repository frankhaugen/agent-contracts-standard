# Templates and examples parity with the normative spec

**ACS type:** Instruction

## After any normative layout or taxonomy change

1. Diff `spec/ACS-v0.1.md` Sections 5–8 against `templates/`, both `examples/`, and [`docs/publisher-layout-and-templates.md`](../../docs/publisher-layout-and-templates.md).
2. Update diagrams, file trees, and prose so **templates** remain the smallest compliant starter and **examples** remain accurate illustrations.
3. Run `pwsh ./scripts/Verify-AcsRepo.ps1` from the repository root; fix failures before merge.
4. Update root `.ai/` when this repo’s maintainer contract should reflect spec changes.
