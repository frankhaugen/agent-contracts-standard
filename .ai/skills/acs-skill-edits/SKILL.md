---
name: acs-skill-edits
description: Creates or edits Agent Skills packages under .ai/skills/, templates/.ai/skills/, or examples. Validates directory name, SKILL.md front matter, and index links. Use for skill structure or YAML fixes. Triggers on SKILL.md, skill package, agentskills, or new skill directory.
license: MIT
---

# ACS skill package edits

1. Conform to **[AGENT-SKILLS]** (`spec/ACS-v0.1.md` §1.9): `name` **MUST** match parent directory; `description` 1–1024 chars with trigger keywords.
2. Prefer **narrow** skills (`acs-normative-edit`, `acs-sync-templates-examples`, …) over one oversized skill; add a new directory when scope is distinct.
3. Update every `.ai/index.md` that should list the skill (root, templates if applicable).
4. Run `pwsh ./scripts/Verify-AcsRepo.ps1`.

For normative §1 edits use [acs-normative-edit](../acs-normative-edit/SKILL.md); for template/example sync use [acs-sync-templates-examples](../acs-sync-templates-examples/SKILL.md).
