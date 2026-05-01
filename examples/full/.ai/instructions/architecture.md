# Architecture instructions

**ACS type:** Instruction

- Keep domain logic independent of delivery mechanisms (CLI, HTTP, jobs).
- Cross-cutting concerns (logging, metrics, auth) go at boundaries, not inside core domain types unless unavoidable.
- Public APIs are versioned or documented in code; breaking changes require an explicit migration note.
