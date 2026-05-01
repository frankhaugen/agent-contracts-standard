# Command: verify layout

**ACS type:** Command

**Invocation:** Maintainer asks to verify repository layout, or before opening a PR that touches paths under `templates/`, `examples/`, or `.ai/`.

**Steps**

1. Run `pwsh ./scripts/Verify-AcsRepo.ps1` from the repository root (requires PowerShell 7+).
2. If the repository is clean, CI on GitHub runs the same checks on `push` and `pull_request`.

**Output:** Script exit code 0 and the printed success line, or a list of concrete missing files and skill validation errors.
