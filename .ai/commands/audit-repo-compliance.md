# Command: audit repository compliance

**ACS type:** Command

**Invocation:** User asks for a full ACS self-compliance audit of **this** standards repository (not a generic consumer repo).

**Steps**

1. Activate skill [acs-compliance-audit](../skills/acs-compliance-audit/SKILL.md) (run script + checklist).
2. Confirm §1.5 *Invariants and vendor neutrality* in `spec/ACS-v0.1.md` against the tree: `AGENTS.md` only at root for ACS entry; ACS-classified contracts under `.ai/`; **Forbidden paths** absent (no `.copilot`/`.claude`/`.cursor` anywhere except under `.git`; under `.github/`: no `copilot-instructions.md`, `copilot/`, `instructions/`, or `prompts/` as in spec); no **required** sole reliance on other vendor-specific agent artifacts (§1.5 *Normative prohibitions*).
3. Confirm §1.7 heading order in `.ai/index.md`.

**Output:** Written audit summary: automated results, manual notes, and follow-up issues if any.
