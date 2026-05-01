# Policy: generated files

**ACS type:** Policy

- Do not hand-edit generated artifacts when the generator is the source of truth; change inputs or generators instead.
- If generated output is committed, regenerating in CI or locally must reproduce the same result for the same inputs (deterministic generation preferred).
- Document how to regenerate in the repository README or a dedicated instruction file.
