# Testing instructions

**ACS type:** Instruction

- Add or update automated tests for behavior you change; prefer fast unit tests for pure logic and integration tests for I/O and composition.
- Name tests after the behavior they assert, not after the implementation type alone.
- Do not skip failing tests in the same change set that introduces the failure unless the team policy allows quarantine with a tracked follow-up.
