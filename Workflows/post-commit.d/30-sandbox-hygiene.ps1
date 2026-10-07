<#
  Workflows/post-commit.d/30-sandbox-hygiene.ps1 -- emitted by new-project.ps1 (fw-T7.C1.S5.SS4).
  Advisory post-commit sweep: surfaces stale _sandbox/ prune-candidates after a commit; NEVER deletes,
  never removes the permanent !Dump/ folder (fw-T7.C1.S5.SS5). Delegates to the pinned FW helper.
  ASCII per fw-T3.C1.S3.SS3.
#>
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$helper = Join-Path $repoRoot 'Governance\_GOV-DesignFramework\Definition\References\scripts\helpers\sandbox-hygiene.ps1'
if (-not (Test-Path $helper)) {
    Write-Host "[post-commit: sandbox-hygiene] FW helper not found at $helper (is the _GOV-DesignFramework submodule checked out?)" -ForegroundColor DarkGray
    exit 0
}
. $helper
[void](Invoke-SandboxHygieneScan -RepoRoot $repoRoot)
exit 0
