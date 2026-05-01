#!/usr/bin/env python3
"""
Strict self-verification for the agent-contracts-standard repository.

Checks ACS v0.1 dogfood layout: AGENTS.md discoverability, .ai/ taxonomy
counts, and Agent Skills name == directory for each skill package.
"""
from __future__ import annotations

import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent

# Files that must exist for this reference repository (extend when layout tightens).
REQUIRED_FILES = [
    "AGENTS.md",
    "CONTRIBUTING.md",
    "SECURITY.md",
    "spec/ACS-v0.1.md",
    ".ai/index.md",
    ".ai/instructions/maintaining-the-spec.md",
    ".ai/instructions/bcp14-requirement-keywords.md",
    ".ai/instructions/normative-vs-informative.md",
    ".ai/instructions/normative-references-maintenance.md",
    ".ai/instructions/templates-examples-parity.md",
    ".ai/instructions/spec-change-gate.md",
    ".ai/policies/spec-integrity.md",
    ".ai/policies/spec-file-human-authorization.md",
    ".ai/policies/discoverability-from-agents.md",
    ".ai/policies/vendor-neutrality-contracts.md",
    ".ai/policies/changelog-for-normative-changes.md",
    ".ai/commands/verify-layout.md",
    ".ai/commands/audit-repo-compliance.md",
    ".ai/commands/prepare-version-bump.md",
    ".ai/commands/review-pr-normative.md",
    ".ai/context/compliance-checklist.md",
    ".ai/context/maintainer-contract-matrix.md",
    ".ai/context/mcp-tool-contract.json",
    "scripts/verify_acs_repo.py",
    "templates/AGENTS.md",
    "templates/.ai/index.md",
    "templates/.ai/skills/example-skill/SKILL.md",
    "examples/minimal/AGENTS.md",
    "examples/minimal/.ai/index.md",
    "examples/full/AGENTS.md",
    "examples/full/.ai/index.md",
    "examples/full/.ai/skills/write-tests/SKILL.md",
]

MIN_INSTRUCTIONS = 6
MIN_POLICIES = 5
MIN_SKILLS = 5
MIN_COMMANDS = 4
MIN_CONTEXT_FILES = 3


def _parse_skill_name(skill_md: pathlib.Path) -> str | None:
    text = skill_md.read_text(encoding="utf-8")
    m = re.match(r"^---\s*\n(.+?)\n---\s*\n", text, re.DOTALL)
    if not m:
        return None
    block = m.group(1)
    nm = re.search(r"^name:\s*(.+)\s*$", block, re.MULTILINE)
    return nm.group(1).strip() if nm else None


def main() -> int:
    errors: list[str] = []

    for rel in REQUIRED_FILES:
        p = ROOT / rel
        if not p.is_file():
            errors.append(f"Missing required file: {rel}")

    try:
        agents = (ROOT / "AGENTS.md").read_text(encoding="utf-8")
    except OSError as e:
        return _fail([f"Cannot read AGENTS.md: {e}"])

    if ".ai/index.md" not in agents:
        errors.append(
            "AGENTS.md MUST reference `.ai/index.md` for ACS discoverability (§1.5 / §1.8)."
        )

    inst = list((ROOT / ".ai" / "instructions").glob("*.md"))
    if len(inst) < MIN_INSTRUCTIONS:
        errors.append(
            f"Expected at least {MIN_INSTRUCTIONS} instruction files under .ai/instructions/, found {len(inst)}."
        )

    pol = list((ROOT / ".ai" / "policies").glob("*.md"))
    if len(pol) < MIN_POLICIES:
        errors.append(
            f"Expected at least {MIN_POLICIES} policy files under .ai/policies/, found {len(pol)}."
        )

    cmds = list((ROOT / ".ai" / "commands").glob("*.md"))
    if len(cmds) < MIN_COMMANDS:
        errors.append(
            f"Expected at least {MIN_COMMANDS} command files under .ai/commands/, found {len(cmds)}."
        )

    ctx = [p for p in (ROOT / ".ai" / "context").iterdir() if p.is_file()]
    if len(ctx) < MIN_CONTEXT_FILES:
        errors.append(
            f"Expected at least {MIN_CONTEXT_FILES} context files under .ai/context/, found {len(ctx)}."
        )

    skills_root = ROOT / ".ai" / "skills"
    skill_dirs = [d for d in sorted(skills_root.iterdir()) if d.is_dir()]
    if len(skill_dirs) < MIN_SKILLS:
        errors.append(
            f"Expected at least {MIN_SKILLS} skill packages under .ai/skills/, found {len(skill_dirs)}."
        )

    for d in skill_dirs:
        sm = d / "SKILL.md"
        if not sm.is_file():
            errors.append(f"Missing SKILL.md in {d.relative_to(ROOT)}")
            continue
        name = _parse_skill_name(sm)
        if name is None:
            errors.append(f"Invalid or missing YAML name in {sm.relative_to(ROOT)}")
            continue
        if name != d.name:
            errors.append(
                f"Skill frontmatter name '{name}' MUST match directory '{d.name}' ({sm.relative_to(ROOT)})"
            )

    idx = ROOT / ".ai" / "index.md"
    if idx.is_file():
        text = idx.read_text(encoding="utf-8")
        markers = [
            "## Instructions",
            "## Policies",
            "## Skills",
            "## Commands",
            "## Context",
        ]
        pos = [text.find(m) for m in markers]
        if -1 in pos:
            errors.append(".ai/index.md MUST contain section headings for all five contract categories.")
        elif pos != sorted(pos):
            errors.append(
                ".ai/index.md section order MUST follow ACS §1.7: Instructions, Policies, Skills, Commands, Context."
            )

    return _fail(errors) if errors else _ok()


def _fail(errors: list[str]) -> int:
    print("\n".join(errors), file=sys.stderr)
    return 1


def _ok() -> int:
    print("ACS repository self-verification passed (strict maintainer checks).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
