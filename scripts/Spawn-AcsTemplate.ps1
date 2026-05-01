#Requires -Version 7.0
<#
.SYNOPSIS
  Copies ACS v0.1 templates/ (AGENTS.md + .ai/) into a destination directory.
.DESCRIPTION
  Use this to scaffold a new repository with the canonical template from this publication.
  Does not overwrite existing files unless -Force is used (then entire template tree overwrites targets).
.PARAMETER Destination
  Target directory (created if missing). Example: C:\src\my-repo
.PARAMETER Force
  Pass to overwrite existing files when copying.
.EXAMPLE
  pwsh ./scripts/Spawn-AcsTemplate.ps1 -Destination C:\src\new-project
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string] $Destination,

    [switch] $Force
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot '..') | Select-Object -ExpandProperty Path
$Source = Join-Path $RepoRoot 'templates'

if (-not (Test-Path -LiteralPath $Source -PathType Container)) {
    throw "Source templates directory not found: $Source"
}

$destFull = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)
if (-not (Test-Path -LiteralPath $destFull)) {
    New-Item -ItemType Directory -Path $destFull | Out-Null
}

Get-ChildItem -LiteralPath $Source -Force | ForEach-Object {
    $target = Join-Path $destFull $_.Name
    Copy-Item -LiteralPath $_.FullName -Destination $target -Recurse -Force:$Force
}

Write-Host "ACS template copied from '$Source' to '$destFull'. Customize AGENTS.md and .ai/ for your project."
