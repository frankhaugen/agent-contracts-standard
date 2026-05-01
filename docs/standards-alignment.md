# Standards alignment (non-normative)

How ACS v0.1 relates to other specifications. Authoritative requirements, **normative references**, and **attribution** are in [spec/ACS-v0.1.md](../spec/ACS-v0.1.md) (especially §1.2, §1.9, §1.10 Acknowledgments). This repository additionally binds agents via [`.ai/policies/spec-file-human-authorization.md`](../.ai/policies/spec-file-human-authorization.md) (not part of the ACS standard).

## AGENTS.md (entry contract)

ACS **requires** a root `AGENTS.md` as the only root-level agent entry contract. That matches the [AGENTS.md](https://agents.md/) convention: Markdown at the repository root, written for coding agents (build and test commands, security, conventions). The AGENTS.md format does not mandate specific headings; ACS adds the requirement that agents can reach the full contract under `.ai/` from that file (see spec §2.2 for a recommended combined outline).

## Model Context Protocol (tools / execution)

ACS **requires** alignment with MCP for executable tools. The tool shape ACS references (and does not redefine) is:

```json
{
  "name": "string",
  "description": "string",
  "input_schema": {}
}
```

Live tools are registered in MCP host configuration. This repository’s **templates** and **examples** include an optional `mcp-tool-contract.json` under `.ai/context/` as a read-only documentation mirror of that shape, plus an instruction file (`mcp-tools.md`) explaining the split.

## Agent Skills (repository-local skills)

ACS **requires** ([spec](../spec/ACS-v0.1.md) §1.2) conformance with [Agent Skills](https://agentskills.io/). Per the [Agent Skills specification](https://agentskills.io/specification), a skill is a **directory** named after the skill id containing at least `SKILL.md` with YAML front matter (`name` and `description` required; `name` must match the directory). ACS places those packages under `.ai/skills/<skill-id>/`.

Validate skills with the upstream [skills-ref](https://github.com/agentskills/agentskills/tree/main/skills-ref) tool when iterating locally.

## Summary

| External concept | ACS relationship |
|------------------|------------------|
| AGENTS.md        | MUST — root entry; Markdown style per agents.md |
| MCP tools        | MUST — shape and execution model; optional JSON mirror in `.ai/context/` |
| Agent Skills     | MUST — `.ai/skills/<skill-id>/SKILL.md` package per Agent Skills spec |
