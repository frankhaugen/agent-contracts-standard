# MCP tools and the ACS Tool contract

**ACS type:** Instruction

Executable **Tools** in ACS are not defined as Markdown files. They are declared by [Model Context Protocol](https://modelcontextprotocol.io/) (MCP) servers and exposed to agents with JSON descriptors.

## Descriptor shape

The fields ACS references match MCP (see normative Section 3 in `spec/ACS-v0.1.md`):

- `name` — stable tool identifier
- `description` — when the tool applies
- `input_schema` — JSON Schema for arguments

## Repository practice

- Keep **live** tool definitions in MCP host configuration (for example your IDE or agent runtime config).
- Optionally store a **read-only** copy or example under `.ai/context/` (for example `mcp-tool-contract.json`) so agents can compare local documentation to runtime without treating the file as an executable definition.
