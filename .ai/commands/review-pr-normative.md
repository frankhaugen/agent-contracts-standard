# Command: review pull request (normative impact)

**ACS type:** Command

**Invocation:** Reviewing a PR that might touch `spec/ACS-v0.1.md` or dependent artifacts.

**Steps**

1. Classify files: §1 normative, §2 informative-only, templates/examples, governance, CI.
2. If `spec/ACS-v0.1.md` changes: verify **explicit human maintainer authorization** per [spec-file-human-authorization.md](../policies/spec-file-human-authorization.md) (issue/PR link in PR body or commits).
3. If §1 changes: require **bold** BCP 14 keywords, `CHANGELOG` entry, parity updates per [templates-examples-parity.md](../instructions/templates-examples-parity.md).
4. If only docs: ensure no new unstated **MUST** language in `README.md` that belongs in §1.
5. Run or request `python3 scripts/verify_acs_repo.py` result from CI.

**Output:** Blocking vs non-blocking comments; explicit “normative impact: yes/no”.
