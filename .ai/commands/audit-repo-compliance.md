# Command: audit repository compliance

**ACS type:** Command

**Invocation:** User asks for a full ACS self-compliance audit of **this** standards repository (not a generic consumer repo).

**Steps**

1. Activate skill [acs-compliance-audit](../skills/acs-compliance-audit/SKILL.md) (run script + checklist).
2. Confirm invariants in `spec/ACS-v0.1.md` §1.5 against actual root files (`AGENTS.md` only at root for entry; contracts under `.ai/`).
3. Confirm §1.7 heading order in `.ai/index.md`.

**Output:** Written audit summary: automated results, manual notes, and follow-up issues if any.
