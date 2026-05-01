# MCP tools in this example repo

**ACS type:** Instruction

Tools your agent can call (database, browser, issue tracker) are **MCP tools**: they are defined in the MCP host configuration, not in `.ai/commands/`.

Use `.ai/context/mcp-tool-contract.json` as a **shape reference** when documenting which tools this project expects (names and argument patterns). At runtime, only the server’s live descriptors matter.
