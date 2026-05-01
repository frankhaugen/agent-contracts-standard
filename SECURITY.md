# Security

## Reporting a vulnerability

Please **do not** open a public GitHub issue for undisclosed security problems with this repository (for example leaked credentials in an example, or a supply-chain concern in CI configuration).

**Preferred:** use [GitHub Security Advisories](https://github.com/frankhaugen/agent-contracts-standard/security/advisories/new) for this repository so the maintainers can coordinate a fix privately.

Include:

- A short description of the issue and affected paths or workflows
- Steps to reproduce, if applicable
- Any suggested mitigation (optional)

## Scope

This repository is primarily **specification text**, **Markdown**, and **GitHub Actions** workflows. There is no production runtime or package registry owned by this repo. Reports about **consuming** ACS in your own product should go through your own security process; we can still update examples or docs here if they teach unsafe patterns.

## After a report

Maintainers will acknowledge receipt as soon as practical, assess impact, prepare a patch or documentation update, and coordinate disclosure with you.
