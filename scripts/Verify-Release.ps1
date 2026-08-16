[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$manifestPath = Join-Path $repoRoot 'manifests\release-manifest.json'

if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
    throw "Release manifest not found: $manifestPath"
}

$manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
$popupFiles = @(Get-ChildItem -LiteralPath (Join-Path $repoRoot 'Config\Popups') -File -Filter '*.statprofile')
$statFiles = @(Get-ChildItem -LiteralPath (Join-Path $repoRoot 'Config\Stats\AAPP pop up Free') -File -Recurse -Filter '*.h2nstat')

if ($popupFiles.Count -ne [int]$manifest.counts.popup_files) {
    throw "Popup count mismatch: expected $($manifest.counts.popup_files), found $($popupFiles.Count)"
}

if ($statFiles.Count -ne [int]$manifest.counts.stat_files) {
    throw "Stat count mismatch: expected $($manifest.counts.stat_files), found $($statFiles.Count)"
}

foreach ($file in $manifest.files) {
    $nativeRelativePath = $file.path.Replace('/', [IO.Path]::DirectorySeparatorChar)
    $fullPath = Join-Path $repoRoot $nativeRelativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        throw "Missing release file: $($file.path)"
    }
    $actualHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $fullPath).Hash.ToLowerInvariant()
    if ($actualHash -ne $file.sha256.ToLowerInvariant()) {
        throw "SHA-256 mismatch: $($file.path)"
    }
}

Write-Host "Popup files: $($popupFiles.Count)"
Write-Host "Stat files: $($statFiles.Count)"
Write-Host 'Verification passed.'
