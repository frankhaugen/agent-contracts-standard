---
name: write-tests
description: Adds or updates automated tests when code behavior changes. Use after implementing features, fixing bugs, refactoring public APIs, or when the user asks for test coverage. Triggers on keywords such as tests, coverage, unit test, and regression.
license: MIT
---

# Write tests

## When this activates

Apply after you change runtime behavior or fix a defect, unless the user explicitly asks to skip tests.

## Steps

1. Identify the public surface or behavior you changed.
2. Pick the narrowest test level that proves it (prefer fast unit tests for pure logic; integration tests for I/O).
3. Add or adjust cases for the happy path, at least one failure or edge case, and any regression tied to the bug or feature.
4. Run the project test command from `AGENTS.md` and fix failures before finishing.

## References

See repository testing instructions in `instructions/testing.md` for project-specific conventions.
