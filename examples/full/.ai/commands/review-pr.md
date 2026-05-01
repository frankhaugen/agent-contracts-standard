# Command: review PR

**ACS type:** Command

**Invocation:** User asks for a pull request review, or references a PR number or URL.

**Workflow:**

1. Summarize the change scope (files, domains touched).
2. Check instructions and policies in `.ai/` for constraints that apply to this diff.
3. Comment on correctness, tests, API stability, and security or privacy impact.
4. List blocking issues, nits, and suggested follow-ups separately.

**Output:** A structured review (summary, findings, suggested actions).
