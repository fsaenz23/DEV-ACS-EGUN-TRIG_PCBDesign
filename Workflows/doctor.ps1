# Workflows/doctor.ps1 -- thin-shell delegate (fw-T3.C1.S3.SS2).
# Emitted by new-project.ps1 Phase 1 (cs-T5.C1.S17). Pure delegation to the pinned
# FW canonical doctor.ps1; passes this repo's root explicitly and forwards EVERY
# other argument verbatim.
#
# Arg-forwarding (cs-v0.41.1): this shell has NO param block; it forwards all arguments
# through the automatic $args by splatting them onto the pinned canonical after -RepoRoot
# (see the delegation line below). This is the same pattern CS's own Workflows/*.ps1 use,
# and it forwards ANY argument the
# canonical script accepts, including ones this shell has never heard of (e.g. fw-v0.48.0's
# -ResetPipelineState for the T3.C1.S3.SS9 run-ordering gate). So new FW pipeline switches
# ride through automatically on a re-pin -- no per-switch maintenance here.
#   Why no param block: declaring a parameter named $args collides with the automatic $args
#   and makes the splat bind positionally (USFLP01-FDS Defect 1, cs-v0.20.2: a commit once
#   landed with subject literally "-Message"). Using the AUTOMATIC $args with NO param block
#   avoids that entirely -- named args (-Message "subject") forward as named, switches forward
#   as switches. (The earlier typed-param + ValueFromRemainingArguments form did NOT forward
#   an undeclared named switch in an advanced function -- the -Tag/-Remote/-ResetPipelineState gap.)
#
# Commit-msg hook self-activation (USFLP01-FDS Defect 2a fix, cs-v0.20.2): git does not
# clone hooks, and core.hooksPath is local config that is not cloned -- so a fresh clone
# has Workflows/hooks/commit-msg present but INACTIVE. This shell sets core.hooksPath on
# each run (idempotent) so the commit-subject gate is live from the first commit on any
# clone. new-project.ps1 also sets it at scaffold time; this covers clones of the repo.
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot

# Defect 2a: ensure the tracked commit-msg hook is active on THIS clone (idempotent;
# silent + non-fatal if git is unavailable or this is not a git working tree).
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

$canonical = Join-Path $repoRoot 'Governance\_GOV-DesignFramework\Definition\References\scripts\doctor.ps1'
if (-not (Test-Path $canonical)) {
    Write-Host "FAILED: FW canonical doctor.ps1 not found at $canonical" -ForegroundColor Red
    Write-Host "        Is the _GOV-DesignFramework submodule checked out? (git submodule update --init)" -ForegroundColor Yellow
    exit 1
}

# Forward EVERY argument verbatim via the automatic $args (named args forward as named,
# switches as switches), injecting only -RepoRoot so the canonical script targets THIS
# repo. No declared params -> any current or future FW switch (e.g. -ResetPipelineState)
# rides through. Same delegation CS's own Workflows/*.ps1 use.
& $canonical -RepoRoot $repoRoot @args
exit $LASTEXITCODE

