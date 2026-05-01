# Standards alignment (non-normative)

How ACS v0.1 relates to other specifications. Authoritative requirements remain in [spec/ACS-v0.1.md](../spec/ACS-v0.1.md).

## AGENTS.md (entry contract)

ACS **requires** a root `AGENTS.md` as the only root-level agent entry contract. That matches the [AGENTS.md](https://agents.md/) convention: a predictable, human-readable file at the top of the repository.

In ACS, `AGENTS.md` should point readers to `.ai/index.md` and the instruction and policy directories at minimum, so the complete contract is reachable without vendor-specific paths.

## Model Context Protocol (tools / execution)

ACS **requires** alignment with MCP for executable tools. The tool shape ACS references (and does not redefine) is:

```json
{
  "name": "string",
  "description": "string",
  "input_schema": {}
}
```

Repository markdown under `.ai/` may **reference** MCP servers or tool names; tool definitions themselves live in MCP configuration or registries, not inside ACS file types.

## Agent Skills (repository-local skills)

ACS **recommends** alignment with [Agent Skills](https://agentskills.io/) for portable skill definitions. ACS still defines **where** skills live in a repo (`.ai/skills/*.md`) and how they fit the taxonomy. Teams can add front matter or packaging compatible with Agent Skills inside those files without changing ACS’s layout rules.

## Summary

| External concept | ACS relationship |
|------------------|------------------|
| AGENTS.md        | MUST — root entry |
| MCP tools        | MUST — shape and execution model |
| Agent Skills     | SHOULD — interoperability for skills |
