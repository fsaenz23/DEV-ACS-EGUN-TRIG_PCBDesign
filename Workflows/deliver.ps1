# Workflows/deliver.ps1 -- thin-shell delegate (fw-T3.C1.S3.SS2) for the 5th canonical script.
# Emitted by new-project.ps1 Phase 1 (cs-T5.C1.S17). Pure delegation to the pinned FW canonical
# deliver.ps1 -- the `-d` DELIVERY-BASELINE cutter (FW owns the body + the manifest/ledger format,
# T11.C1.S10). CS owns the `-d` tag GRAMMAR (cs-T5.C1.S17.SS12:
# <project-prefix>-d<YYYYMMDD>[-<CustCode>][-<seq>]) -- pass a conforming -DeliveryTag.
#
# E7 gating (T7.C1.S19): the internal validate -> push -> tag abort-on-fail pipeline gating lives in
# FW's deliver.ps1 body and is FW-OWNED -- this shell adds NO CS gating logic; it is pure delegation.
#
# Unlike the generic push/pull/validate/tag thin-shell, this declares deliver.ps1's named
# parameters EXPLICITLY so -DeliveryTag / -CustCode / -Package / -SiteLocation / -Remote forward
# BY NAME via @PSBoundParameters (the generic shell only declares the push/tag param set). Do NOT
# name a parameter $args (it collides with the automatic $args and makes the splat bind
# positionally -- the cs-v0.20.2 Defect-1 trap). Extra/rare tokens ride $Passthrough.
#
# Keep this param block in sync with FW's canonical deliver.ps1 signature; -RefreshGlue refreshes it.
[CmdletBinding()]
param(
    [string]$DeliveryTag,
    [string]$Remote = 'origin',
    [string]$Package,
    [string]$CustCode,
    [string]$SiteLocation,
    [switch]$DryRun,
    [switch]$NoConfirm,
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Passthrough
)
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot

# Ensure the tracked commit-msg hook is active on THIS clone (idempotent; silent + non-fatal).
try {
    if (Test-Path (Join-Path $repoRoot '.git')) {
        $hp = & git -C $repoRoot config --local core.hooksPath 2>$null
        if ($hp -ne 'Workflows/hooks') {
            & git -C $repoRoot config core.hooksPath 'Workflows/hooks' 2>$null
            Write-Host "[thin-shell] Activated core.hooksPath = Workflows/hooks (commit-subject gate now live on this clone)." -ForegroundColor DarkGray
        }
    }
} catch { }

# _sandbox/!Dump is the permanent inbox (fw-T7.C1.S5.SS5) but is gitignored + NOT cloned -- recreate it on
# any clone where it is missing (idempotent; stays untracked, holds transient local scratch).
try {
    $dump = Join-Path $repoRoot '_sandbox\!Dump'
    if (-not (Test-Path $dump)) { New-Item -ItemType Directory -Path $dump -Force | Out-Null }
} catch { }

$canonical = Join-Path $repoRoot 'Governance\_GOV-DesignFramework\Definition\References\scripts\deliver.ps1'
if (-not (Test-Path $canonical)) {
    Write-Host "FAILED: FW canonical deliver.ps1 not found at $canonical" -ForegroundColor Red
    Write-Host "        Is the _GOV-DesignFramework submodule checked out? (git submodule update --init)" -ForegroundColor Yellow
    exit 1
}

# Forward declared named params via @PSBoundParameters (named binding preserved -- no $args collision),
# plus any extra tokens via @rest.
$forward = @{}
foreach ($k in $PSBoundParameters.Keys) {
    if ($k -ne 'Passthrough') { $forward[$k] = $PSBoundParameters[$k] }
}
$rest = @()
if ($Passthrough) { $rest = $Passthrough }
& $canonical -RepoRoot $repoRoot @forward @rest
exit $LASTEXITCODE

