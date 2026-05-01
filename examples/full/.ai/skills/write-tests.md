# Skill: write tests

**ACS type:** Skill

**When to use:** After implementing or fixing behavior, or when the user asks for test coverage in an area that lacks it.

**Steps:**

1. Identify the public surface or behavior under change.
2. Choose the narrowest test level that proves the behavior (unit vs integration).
3. Add cases for happy path, one failure mode, and any regression tied to the change.
4. Run the project’s test command and fix failures before finishing.

Align with [Agent Skills](https://agentskills.io/) where you publish skills beyond this repository; this file is the local definition.
