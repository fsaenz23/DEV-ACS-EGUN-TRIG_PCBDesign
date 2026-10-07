# Workflows/update.ps1 -- thin-shell delegate (fw-T3.C1.S3.SS2) for the FW update.ps1 body (E10).
# Emitted by new-project.ps1 Phase 1 (cs-T5.C1.S17, cs-v0.45.0). Pure delegation to the pinned FW
# canonical update.ps1 PLUS one CS-owned obligation: when an update advances the regulatory CFR pin,
# TRIGGER a `new-project.ps1 -Mode seed` re-derive of the regulatory branch as DERIVE-THEN-CONFIRM
# (cs-T5.C1.S17 / E10). FW owns the update body + the actual pin advance; CS owns the seed-derive
# trigger + the never-silently-overwrite guard.
#
# Arg-forwarding (cs-v0.41.1 pattern): NO param block. Every argument forwards verbatim through the
# automatic $args by splatting after -RepoRoot. This forwards ALL of FW update's selection modes
# (--all | --governance | --repo-modules | --modules | --interactive) and ANY future flag with no
# per-switch maintenance here -- same as the push/validate/tag/survey-updates/doctor thin-shells.
#   Why no param block: a parameter named $args collides with the automatic $args and makes the splat
#   bind positionally (cs-v0.20.2 Defect-1). Using the AUTOMATIC $args with NO param block forwards
#   named args as named + switches as switches.
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

$canonical = Join-Path $repoRoot 'Governance\_GOV-DesignFramework\Definition\References\scripts\update.ps1'
if (-not (Test-Path $canonical)) {
    Write-Host "FAILED: FW canonical update.ps1 not found at $canonical" -ForegroundColor Red
    Write-Host "        Is the _GOV-DesignFramework submodule checked out? (git submodule update --init)" -ForegroundColor Yellow
    exit 1
}

# E11 compat-resolver wiring (cs-T5.C1.S17): the consistent family target-set the update advances toward
# is resolved by FW's compat-resolver.ps1 (FW owns the resolver body). Capture the regulatory CFR pin
# BEFORE the update so the CFR-bump trigger below can detect a change. The pin lives in
# Definition/References/instance-contract.yaml (level: facility) as a `cfr_pin:` / `regulatory_pin:` line
# for a regulatory-derived (seeded) Terminal Project; absent for non-regulatory repos (then no-op).
function Get-CfrPin {
    param([string]$Root)
    $ic = Join-Path $Root 'Definition\References\instance-contract.yaml'
    if (-not (Test-Path $ic)) { return $null }
    try {
        $line = Select-String -Path $ic -Pattern '^\s*(cfr_pin|regulatory_pin)\s*:\s*(.+?)\s*$' -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($line) { return ($line.Matches[0].Groups[2].Value.Trim().Trim('"').Trim("'")) }
    } catch { }
    return $null
}
$cfrBefore = Get-CfrPin -Root $repoRoot

# Delegate to the FW update body (forwards every selection mode + future flag via @args).
& $canonical -RepoRoot $repoRoot @args
$rc = $LASTEXITCODE

# CFR-bump -> -Mode seed re-derive TRIGGER (E10, cs-T5.C1.S17). If the update advanced the regulatory CFR
# pin, the regulatory branch must be RE-DERIVED via `new-project.ps1 -Mode seed` as DERIVE-THEN-CONFIRM:
# the re-derive surfaces the applicable-set delta and PRESERVES the consumer-owned fields
# (burden / burden_party / note / edition / method_status), refreshing ONLY the method-owned values.
# This shell does NOT run the re-derive itself (the heavy derive body is FW/consumer-side + interactive)
# and NEVER silently overwrites the regulatory branch -- it SURFACES the trigger + the exact guarded
# command for the operator to run under review.
if ($rc -eq 0) {
    $cfrAfter = Get-CfrPin -Root $repoRoot
    if ($cfrBefore -and $cfrAfter -and ($cfrBefore -ne $cfrAfter)) {
        Write-Host ""
        Write-Host "[update] CFR pin advanced: $cfrBefore -> $cfrAfter" -ForegroundColor Yellow
        Write-Host "[update] TRIGGER (E10): re-derive the regulatory branch via -Mode seed as DERIVE-THEN-CONFIRM." -ForegroundColor Yellow
        Write-Host "         Run (review the applicable-set delta; consumer-owned burden/burden_party/note/edition/" -ForegroundColor DarkGray
        Write-Host "         method_status are PRESERVED, only method-owned values refresh -- nothing is silently overwritten):" -ForegroundColor DarkGray
        Write-Host "           new-project.ps1 -Mode seed -FromPath $repoRoot -EmitTo scratch" -ForegroundColor Cyan
        Write-Host "         Then diff the emitted regulatory branch against the live one and confirm before promoting." -ForegroundColor DarkGray
    }
}

exit $rc

