# Rationale (non-normative)

This document explains why the Agent Contracts Standard (ACS) exists. The binding definition is [spec/ACS-v0.1.md](../spec/ACS-v0.1.md).

## Problem

Software repositories increasingly rely on automated agents for review, refactoring, documentation, and operations. Those agents need **discoverable**, **categorized** instructions and constraints. Without a shared layout, teams duplicate ad hoc files (for example editor-specific or vendor-specific locations), and behavior becomes hard to audit or port across tools.

## What ACS optimizes for

- **Single entrypoint:** `AGENTS.md` at the repository root aligns with the broader AGENTS.md ecosystem so humans and tools know where to start.
- **One contract root:** Everything else lives under `.ai/`, so “agent behavior for this repo” is a subtree you can copy, lint, or archive as a unit.
- **Clear taxonomy:** Instructions, policies, skills, commands, and context have different lifetimes and enforcement semantics. Naming those types avoids dumping everything into one markdown file.
- **Vendor neutrality:** ACS does not require tool-specific filenames. Compliance is defined by structure and discoverability, not by a particular runtime.

## Discoverability

The invariant that **all agent behavior must be discoverable from `AGENTS.md`** keeps onboarding simple: open the root contract, follow links to `.ai/index.md`, then drill into categories in resolution order. That mirrors how maintainers already think about “read me first, then details.”

## What ACS deliberately avoids

ACS does not prescribe orchestration, scheduling, or how an engine loads files. Those concerns belong to products and runtimes that can adopt ACS as their **repository-facing** contract layer.
