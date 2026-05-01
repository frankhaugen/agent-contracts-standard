# Command: prepare ACS version bump

**ACS type:** Command

**Invocation:** Maintainer prepares a new ACS version (for example 0.2) after normative changes.

**Steps**

1. Freeze scope: list every §1 change since last tag or `CHANGELOG` version.
2. Update `spec/ACS-v0.1.md` metadata table (rename file to `ACS-v0.2.md` only if project policy renames; otherwise bump Version field per project convention).
3. Update `CHANGELOG.md` with a new section and migration notes if layout breaks adopters.
4. Sync `docs/publisher-layout-and-templates.md`, `templates/`, `examples/`, and `scripts/Verify-AcsRepo.ps1` expectations.
5. Run `pwsh ./scripts/Verify-AcsRepo.ps1` and CI.

**Output:** PR description draft listing breaking vs additive changes.
