---
name: acs-sync-templates-examples
description: Aligns templates/ and examples/ with spec ACS-v0.1 after layout or taxonomy changes. Use when publisher docs or §1.4–§1.7 paths change. Triggers on templates, examples, parity, or publisher-layout.
license: MIT
---

# Sync templates and examples

## Preconditions

Read [templates-examples-parity.md](../../instructions/templates-examples-parity.md).

## Steps

1. Diff `spec/ACS-v0.1.md` §1.4–§1.7 against `templates/`, both `examples/`, and [`docs/publisher-layout-and-templates.md`](../../docs/publisher-layout-and-templates.md).
2. Update file trees, `AGENTS.md` samples, and `.ai/index.md` examples.
3. Ensure every skill under `templates/` and `examples/full` uses **Agent Skills** packages (`SKILL.md`, `name` = directory).
4. Run `python3 scripts/verify_acs_repo.py`.
