# Human authorization for edits to `spec/ACS-v0.1.md`

**ACS type:** Policy

This policy applies to **this repository** and binds humans and automated agents working here. It does **not** change ACS v0.1 as a standard; it governs **how** this publication may evolve.

## Rules

1. **MUST NOT** modify `spec/ACS-v0.1.md` (any section, including §2 diagrams, front matter table, punctuation, or links) without **explicit written instruction from a human maintainer** recorded in durable project history: a GitHub **issue** (opened or commented by a maintainer), a **pull request** description or review comment from a maintainer, or another written record the project treats as authoritative.
2. **MUST NOT** treat any of the following as authorization: casual conversation, implied consent, “obvious” improvements, prior agent messages in a chat session, or autonomous application of “repository best practices.”
3. If a task appears to require changing the normative or informative text of `spec/ACS-v0.1.md` and **no** maintainer instruction exists, **MUST** stop and request written instruction before editing that file.
4. **MUST** cite the authorizing issue or PR (number or link) in the commit message or PR that touches `spec/ACS-v0.1.md`.

## Rationale

The specification document is the **contract for the ecosystem**. Silent or agent-initiated edits undermine trust and versioning. This policy is **stricter** than ACS §1.8 and exists only for **this** publication workflow.
