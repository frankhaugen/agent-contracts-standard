# Templates and examples parity with §1

**ACS type:** Instruction

## After any §1 layout or taxonomy change

1. Update [`docs/publisher-layout-and-templates.md`](../../docs/publisher-layout-and-templates.md) if this publication’s tree or example descriptions change.
2. Update `templates/` so a new adopter still receives a valid minimal ACS tree.
3. Update `examples/minimal/` and `examples/full/` per [docs/publisher-layout-and-templates.md](../../docs/publisher-layout-and-templates.md).
4. Update root `.ai/` when this repo’s maintainer contract should reflect §1 changes.
5. Extend `scripts/verify_acs_repo.py` **REQUIRED_FILES** or directory counts if the contract for *this* repo intentionally tightens.

## Verification

Run `python3 scripts/verify_acs_repo.py` locally before pushing substantive layout changes.
