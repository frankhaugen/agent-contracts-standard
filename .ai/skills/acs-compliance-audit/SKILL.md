---
name: acs-compliance-audit
description: Audits this repository for ACS v0.1 self-consistency—AGENTS.md discovery, .ai/index completeness, skill packages, and verify script. Use before releases or when user asks if the repo is compliant. Triggers on audit, compliance, self-check, or verify repo.
license: MIT
---

# ACS compliance audit (this repository)

## Steps

1. Run `pwsh ./scripts/Verify-AcsRepo.ps1` and capture output.
2. Manually confirm `AGENTS.md` links to `.ai/index.md` and lists Required reads per entry contract.
3. Walk `.ai/index.md`: every linked file exists; section order matches spec §1.7 (Instructions, Policies, Skills, Commands, Context).
4. Open [compliance-checklist.md](../../context/compliance-checklist.md) and tick mentally each item; file issues for gaps.

## Output

Pass/fail for the script plus a bullet list of manual findings.
