# Templates and examples parity with §1

**ACS type:** Instruction

## After any §1 layout or taxonomy change

1. Update `spec/ACS-v0.1.md` **§2.1** tree diagrams if they describe this repository.
2. Update `templates/` so a new adopter still receives a valid minimal ACS tree.
3. Update `examples/minimal/` and `examples/full/` per their stated roles (§2.3 / §2.4).
4. Update root `.ai/` if this repo’s dogfood layout is cited in §2.1.
5. Extend `scripts/verify_acs_repo.py` **REQUIRED_FILES** or directory counts if the contract for *this* repo intentionally tightens.

## Verification

Run `python3 scripts/verify_acs_repo.py` locally before pushing substantive layout changes.
