# Auto commit script - generate commit message based on changes
param(
    [string]$CustomMessage = ""
)

$ErrorActionPreference = "Stop"

# Color definitions
$Green = "`e[32m"
$Yellow = "`e[33m"
$Red = "`e[31m"
$Reset = "`e[0m"

Write-Host "${Yellow}[Auto Commit] Starting...${Reset}"

# Check if in git repository
try {
    $null = git rev-parse --git-dir 2>$null
} catch {
    Write-Host "${Red}Error: Not a git repository${Reset}"
    exit 1
}

# Get current branch
$currentBranch = git branch --show-current
Write-Host "Branch: $currentBranch"

# Check for changes
$status = git status --porcelain
if (-not $status) {
    Write-Host "${Green}No changes to commit${Reset}"
    exit 0
}

# Show changed files
Write-Host "`nChanges detected:"
$status | ForEach-Object {
    $fileStatus = $_.Substring(0, 2)
    $fileName = $_.Substring(3)
    $statusCode = $fileStatus.Trim()
    if ($statusCode -eq "M") {
        Write-Host "  [M] $fileName"
    } elseif ($statusCode -eq "A") {
        Write-Host "  [A] $fileName"
    } elseif ($statusCode -eq "D") {
        Write-Host "  [D] $fileName"
    } elseif ($statusCode -eq "??") {
        Write-Host "  [?] $fileName"
    } else {
        Write-Host "  [$statusCode] $fileName"
    }
}

# Generate commit message
function Get-CommitMessage {
    $added = @()
    $modified = @()
    $deleted = @()
    
    $status | ForEach-Object {
        $fileStatus = $_.Substring(0, 2).Trim()
        $fileName = $_.Substring(3)
        
        if ($fileStatus -eq "A" -or $fileStatus -eq "??") {
            $added += $fileName
        } elseif ($fileStatus -eq "M") {
            $modified += $fileName
        } elseif ($fileStatus -eq "D") {
            $deleted += $fileName
        }
    }
    
    $parts = @()
    
    if ($added.Count -gt 0) {
        if ($added.Count -eq 1) {
            $file = Split-Path $added[0] -Leaf
            $parts += "add $file"
        } else {
            $parts += "add $($added.Count) files"
        }
    }
    
    if ($modified.Count -gt 0) {
        if ($modified.Count -eq 1) {
            $file = Split-Path $modified[0] -Leaf
            $parts += "update $file"
        } else {
            $parts += "update $($modified.Count) files"
        }
    }
    
    if ($deleted.Count -gt 0) {
        if ($deleted.Count -eq 1) {
            $file = Split-Path $deleted[0] -Leaf
            $parts += "delete $file"
        } else {
            $parts += "delete $($deleted.Count) files"
        }
    }
    
    return $parts -join ", "
}

# Determine commit message
if ($CustomMessage) {
    $commitMessage = $CustomMessage
} else {
    $commitMessage = Get-CommitMessage
}

Write-Host "`nCommit message: $commitMessage"

# Add all changes
Write-Host "`nStaging files..."
git add -A

# Commit
Write-Host "Creating commit..."
git commit -m "$commitMessage"

# Push to remote
Write-Host "`nPushing to GitHub..."
try {
    git push origin $currentBranch
    Write-Host "${Green}Successfully pushed to origin/$currentBranch${Reset}"
} catch {
    Write-Host "Push failed, trying to set upstream..."
    git push -u origin $currentBranch
    Write-Host "${Green}Successfully pushed to origin/$currentBranch${Reset}"
}

Write-Host "`n${Green}[Auto Commit] Done!${Reset}"
