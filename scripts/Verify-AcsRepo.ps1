#Requires -Version 7.0
<#
.SYNOPSIS
  Strict self-verification for the agent-contracts-standard repository (ACS dogfood).
.NOTES
  Run from repository root: pwsh ./scripts/Verify-AcsRepo.ps1
#>
Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot '..') | Select-Object -ExpandProperty Path

$RequiredFiles = @(
    'AGENTS.md',
    'CONTRIBUTING.md',
    'SECURITY.md',
    'spec/ACS-v0.1.md',
    'docs/publisher-layout-and-templates.md',
    '.ai/index.md',
    '.ai/instructions/maintaining-the-spec.md',
    '.ai/instructions/bcp14-requirement-keywords.md',
    '.ai/instructions/normative-vs-informative.md',
    '.ai/instructions/normative-references-maintenance.md',
    '.ai/instructions/templates-examples-parity.md',
    '.ai/instructions/spec-change-gate.md',
    '.ai/policies/spec-integrity.md',
    '.ai/policies/spec-file-human-authorization.md',
    '.ai/policies/discoverability-from-agents.md',
    '.ai/policies/vendor-neutrality-contracts.md',
    '.ai/policies/changelog-for-normative-changes.md',
    '.ai/commands/verify-layout.md',
    '.ai/commands/audit-repo-compliance.md',
    '.ai/commands/prepare-version-bump.md',
    '.ai/commands/review-pr-normative.md',
    '.ai/context/compliance-checklist.md',
    '.ai/context/maintainer-contract-matrix.md',
    '.ai/context/mcp-tool-contract.json',
    'scripts/Verify-AcsRepo.ps1',
    'scripts/Spawn-AcsTemplate.ps1',
    'scripts/SpawnAcsTemplate.cs',
    'scripts/SpawnAcsTemplate.csproj',
    'templates/AGENTS.md',
    'templates/.ai/index.md',
    'templates/.ai/skills/example-skill/SKILL.md',
    'examples/minimal/AGENTS.md',
    'examples/minimal/.ai/index.md',
    'examples/full/AGENTS.md',
    'examples/full/.ai/index.md',
    'examples/full/.ai/skills/write-tests/SKILL.md'
)

$MinInstructions = 6
$MinPolicies = 5
$MinSkills = 5
$MinCommands = 4
$MinContextFiles = 3

$Errors = [System.Collections.Generic.List[string]]::new()

foreach ($rel in $RequiredFiles) {
    $p = Join-Path $RepoRoot $rel
    if (-not (Test-Path -LiteralPath $p -PathType Leaf)) {
        [void]$Errors.Add("Missing required file: $rel")
    }
}

# spec §1.5 Forbidden paths — absolute prohibition (version-controlled tree)
$ForbiddenDotNames = @('.copilot', '.claude', '.cursor')
foreach ($name in $ForbiddenDotNames) {
    $hits = Get-ChildItem -LiteralPath $RepoRoot -Recurse -Force -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -eq $name -and $_.FullName -notmatch '[\\/]\.git[\\/]' }
    foreach ($h in $hits) {
        $rel = $h.FullName.Substring($RepoRoot.Length).TrimStart('\', '/')
        [void]$Errors.Add("Forbidden name MUST NOT exist in tree (spec ACS §1.5 Forbidden paths): $rel")
    }
}

$ForbiddenGithubRel = @(
    '.github/copilot-instructions.md',
    '.github/copilot',
    '.github/instructions',
    '.github/prompts'
)
foreach ($rel in $ForbiddenGithubRel) {
    $normalized = $rel -replace '/', [IO.Path]::DirectorySeparatorChar
    $p = Join-Path $RepoRoot $normalized
    if (Test-Path -LiteralPath $p) {
        [void]$Errors.Add("Forbidden path MUST NOT exist (spec ACS §1.5 Forbidden paths): $rel")
    }
}

$agentsPath = Join-Path $RepoRoot 'AGENTS.md'
$agents = Get-Content -LiteralPath $agentsPath -Raw -Encoding utf8
if ($agents -notmatch '\.ai/index\.md') {
    [void]$Errors.Add('AGENTS.md MUST reference `.ai/index.md` for ACS discoverability (§1.5 / §1.8).')
}

$instDir = Join-Path $RepoRoot '.ai/instructions'
$instCount = (Get-ChildItem -LiteralPath $instDir -Filter '*.md' -File).Count
if ($instCount -lt $MinInstructions) {
    [void]$Errors.Add("Expected at least $MinInstructions instruction files under .ai/instructions/, found $instCount.")
}

$polDir = Join-Path $RepoRoot '.ai/policies'
$polCount = (Get-ChildItem -LiteralPath $polDir -Filter '*.md' -File).Count
if ($polCount -lt $MinPolicies) {
    [void]$Errors.Add("Expected at least $MinPolicies policy files under .ai/policies/, found $polCount.")
}

$cmdDir = Join-Path $RepoRoot '.ai/commands'
$cmdCount = (Get-ChildItem -LiteralPath $cmdDir -Filter '*.md' -File).Count
if ($cmdCount -lt $MinCommands) {
    [void]$Errors.Add("Expected at least $MinCommands command files under .ai/commands/, found $cmdCount.")
}

$ctxDir = Join-Path $RepoRoot '.ai/context'
$ctxCount = (Get-ChildItem -LiteralPath $ctxDir -File).Count
if ($ctxCount -lt $MinContextFiles) {
    [void]$Errors.Add("Expected at least $MinContextFiles context files under .ai/context/, found $ctxCount.")
}

$skillsRoot = Join-Path $RepoRoot '.ai/skills'
$skillDirs = Get-ChildItem -LiteralPath $skillsRoot -Directory
if ($skillDirs.Count -lt $MinSkills) {
    [void]$Errors.Add("Expected at least $MinSkills skill packages under .ai/skills/, found $($skillDirs.Count).")
}

foreach ($d in $skillDirs) {
    $skillMd = Join-Path $d.FullName 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillMd -PathType Leaf)) {
        [void]$Errors.Add("Missing SKILL.md in $($d.FullName.Substring($RepoRoot.Length).TrimStart('\','/'))")
        continue
    }
    $raw = Get-Content -LiteralPath $skillMd -Raw -Encoding utf8
    if ($raw -notmatch '(?s)^---\r?\n(.+?)\r?\n---') {
        [void]$Errors.Add("Invalid or missing YAML frontmatter in $($skillMd.Substring($RepoRoot.Length).TrimStart('\','/'))")
        continue
    }
    $fm = $Matches[1]
    if ($fm -notmatch '(?m)^name:\s*(.+)\s*$') {
        [void]$Errors.Add("No name: in frontmatter $($skillMd.Substring($RepoRoot.Length).TrimStart('\','/'))")
        continue
    }
    $name = $Matches[1].Trim()
    if ($name -ne $d.Name) {
        [void]$Errors.Add("Skill frontmatter name '$name' MUST match directory '$($d.Name)' ($($skillMd.Substring($RepoRoot.Length).TrimStart('\','/')))")
    }
}

$indexPath = Join-Path $RepoRoot '.ai/index.md'
$idx = Get-Content -LiteralPath $indexPath -Raw -Encoding utf8
$markers = @('## Instructions', '## Policies', '## Skills', '## Commands', '## Context')
$positions = foreach ($m in $markers) { $idx.IndexOf($m, [StringComparison]::Ordinal) }
if ($positions -contains -1) {
    [void]$Errors.Add('.ai/index.md MUST contain section headings for all five contract categories.')
}
else {
    for ($i = 1; $i -lt $positions.Count; $i++) {
        if ($positions[$i] -le $positions[$i - 1]) {
            [void]$Errors.Add('.ai/index.md section order MUST follow ACS §1.7: Instructions, Policies, Skills, Commands, Context.')
            break
        }
    }
}

if ($Errors.Count -gt 0) {
    foreach ($e in $Errors) { Write-Host $e -ForegroundColor Red }
    exit 1
}

Write-Host 'ACS repository self-verification passed (strict maintainer checks).'
exit 0
