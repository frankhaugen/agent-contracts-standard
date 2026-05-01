# Gate: changes to `spec/ACS-v0.1.md`

**ACS type:** Instruction

## Before any edit to the spec file

1. Confirm a **human maintainer** has given **explicit written instruction** per [spec-file-human-authorization.md](../policies/spec-file-human-authorization.md).
2. Prefer a dedicated GitHub **issue** scoped to the spec change; link it from the PR.
3. Do **not** “bundle” unrelated spec edits: one logical spec change per PR unless the maintainer instruction explicitly covers multiple items.

## After the edit

1. Update `CHANGELOG.md` when user-visible or compliance meaning changes.
2. Run `python3 scripts/verify_acs_repo.py`.
