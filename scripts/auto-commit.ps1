# 自动提交脚本 - 根据变更内容生成提交信息
param(
    [string]$CustomMessage = ""
)

$ErrorActionPreference = "Stop"

# 颜色定义
$Green = "`e[32m"
$Yellow = "`e[33m"
$Red = "`e[31m"
$Reset = "`e[0m"

Write-Host "${Yellow}🚀 开始自动提交流程...${Reset}" -ForegroundColor Yellow

# 检查是否在 git 仓库中
try {
    $null = git rev-parse --git-dir 2>$null
} catch {
    Write-Host "${Red}❌ 错误：当前目录不是 Git 仓库${Reset}" -ForegroundColor Red
    exit 1
}

# 获取当前分支
$currentBranch = git branch --show-current
Write-Host "📍 当前分支: $currentBranch" -ForegroundColor Cyan

# 检查是否有变更
$status = git status --porcelain
if (-not $status) {
    Write-Host "${Green}✅ 没有需要提交的变更${Reset}" -ForegroundColor Green
    exit 0
}

# 显示变更文件
Write-Host "`n📁 检测到以下变更：" -ForegroundColor Cyan
$status | ForEach-Object {
    $fileStatus = $_.Substring(0, 2)
    $fileName = $_.Substring(3)
    switch -Regex ($fileStatus.Trim()) {
        "M"  { Write-Host "  📝 修改: $fileName" -ForegroundColor Yellow }
        "A"  { Write-Host "  ➕ 新增: $fileName" -ForegroundColor Green }
        "D"  { Write-Host "  🗑️  删除: $fileName" -ForegroundColor Red }
        "??" { Write-Host "  🆕 未跟踪: $fileName" -ForegroundColor Blue }
        default { Write-Host "  📄 $fileStatus : $fileName" }
    }
}

# 生成提交信息
function Generate-CommitMessage {
    $added = @()
    $modified = @()
    $deleted = @()
    
    $status | ForEach-Object {
        $fileStatus = $_.Substring(0, 2).Trim()
        $fileName = $_.Substring(3)
        
        switch -Regex ($fileStatus) {
            "A" { $added += $fileName }
            "M" { $modified += $fileName }
            "D" { $deleted += $fileName }
            "\?\?" { $added += $fileName }
        }
    }
    
    $messageParts = @()
    
    if ($added.Count -gt 0) {
        if ($added.Count -eq 1) {
            $file = Split-Path $added[0] -Leaf
            $messageParts += "添加 $file"
        } else {
            $messageParts += "添加 $($added.Count) 个文件"
        }
    }
    
    if ($modified.Count -gt 0) {
        if ($modified.Count -eq 1) {
            $file = Split-Path $modified[0] -Leaf
            $messageParts += "更新 $file"
        } else {
            $messageParts += "更新 $($modified.Count) 个文件"
        }
    }
    
    if ($deleted.Count -gt 0) {
        if ($deleted.Count -eq 1) {
            $file = Split-Path $deleted[0] -Leaf
            $messageParts += "删除 $file"
        } else {
            $messageParts += "删除 $($deleted.Count) 个文件"
        }
    }
    
    return $messageParts -join "，"
}

# 确定提交信息
if ($CustomMessage) {
    $commitMessage = $CustomMessage
} else {
    $commitMessage = Generate-CommitMessage
}

Write-Host "`n💬 提交信息: $commitMessage" -ForegroundColor Magenta

# 添加所有变更
Write-Host "`n📤 添加文件到暂存区..." -ForegroundColor Cyan
git add -A

# 提交
Write-Host "💾 创建提交..." -ForegroundColor Cyan
git commit -m "$commitMessage"

# 推送到远程
Write-Host "`n🚀 推送到 GitHub..." -ForegroundColor Cyan
try {
    git push origin $currentBranch
    Write-Host "${Green}✅ 成功推送到 origin/$currentBranch${Reset}" -ForegroundColor Green
} catch {
    Write-Host "${Yellow}⚠️ 推送失败，尝试设置上游分支...${Reset}" -ForegroundColor Yellow
    git push -u origin $currentBranch
    Write-Host "${Green}✅ 成功推送到 origin/$currentBranch${Reset}" -ForegroundColor Green
}

Write-Host "`n${Green}🎉 自动提交完成！${Reset}" -ForegroundColor Green
