# Vendor neutrality of published contracts

**ACS type:** Policy

1. `templates/` and `examples/` **MUST NOT** require vendor-specific filenames or proprietary config as a condition of describing **ACS compliance** (per spec §1.5 *Vendor-specific artifacts* and *Normative prohibitions*).
2. `templates/` and `examples/` **MUST NOT** include any path listed under spec §1.5 *Forbidden paths* (for example any `.cursor` directory or file, `.github/copilot-instructions.md`, or `.github/instructions/`).
3. Optional mentions of tools (editors, CLIs) **MAY** appear in informative docs for ergonomics; they **MUST NOT** read as mandatory for ACS v0.1 compliance unless §1 explicitly says so.
