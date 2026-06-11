# AI Coding Toolkit - Windows 一键安装脚本
# 包含：CC Switch + OpenAI Codex CLI + Cloudflare Wrangler CLI

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   AI Coding Toolkit - Windows 安装器" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查管理员权限
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "⚠️  建议以管理员权限运行此脚本" -ForegroundColor Yellow
    Write-Host "右键点击 PowerShell → '以管理员身份运行'" -ForegroundColor Yellow
    $confirm = Read-Host "是否继续？(y/n)"
    if ($confirm -ne "y") { exit 1 }
}
Write-Host ""

# ============================================
# 1. 安装 CC Switch
# ============================================
Write-Host "[1/3] 正在安装 CC Switch..." -ForegroundColor Green

# 获取最新版本下载链接
Write-Host "  正在获取 CC Switch 最新版本..." -ForegroundColor Gray
$ccReleases = "https://api.github.com/repos/farion1231/cc-switch/releases/latest"
try {
    $releaseInfo = Invoke-RestMethod -Uri $ccReleases -Headers @{ "User-Agent" = "PowerShell" }
    $msiAsset = $releaseInfo.assets | Where-Object { $_.name -like "*.msi" } | Select-Object -First 1

    if ($msiAsset) {
        $msiUrl = $msiAsset.browser_download_url
        $msiPath = "$env:TEMP\cc-switch-installer.msi"

        Write-Host "  下载: $($msiAsset.name)" -ForegroundColor Gray
        Invoke-WebRequest -Uri $msiUrl -OutFile $msiPath -UseBasicParsing

        Write-Host "  正在静默安装..." -ForegroundColor Gray
        Start-Process msiexec.exe -Wait -ArgumentList "/i `"$msiPath`" /quiet /norestart"

        Write-Host "  ✅ CC Switch 安装完成" -ForegroundColor Green
    } else {
        Write-Host "  ❌ 未找到 MSI 安装包" -ForegroundColor Red
    }
} catch {
    Write-Host "  ❌ CC Switch 安装失败: $_" -ForegroundColor Red
    Write-Host "  请手动下载: https://github.com/farion1231/cc-switch/releases/latest" -ForegroundColor Yellow
}

Write-Host ""

# ============================================
# 2. 安装 OpenAI Codex CLI
# ============================================
Write-Host "[2/3] 正在安装 OpenAI Codex CLI..." -ForegroundColor Green

# 检查 Node.js
try {
    $nodeVersion = node --version 2>$null
    Write-Host "  检测到 Node.js: $nodeVersion" -ForegroundColor Gray
} catch {
    Write-Host "  ❌ 未检测到 Node.js，请先安装 Node.js (https://nodejs.org/)" -ForegroundColor Red
    Write-Host "  按任意键退出..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit 1
}

# 安装 Codex CLI
Write-Host "  正在安装 @openai/codex (全局)..." -ForegroundColor Gray
npm install -g @openai/codex

if ($LASTEXITCODE -eq 0) {
    Write-Host "  ✅ OpenAI Codex CLI 安装完成" -ForegroundColor Green
} else {
    Write-Host "  ❌ OpenAI Codex CLI 安装失败" -ForegroundColor Red
}

Write-Host ""

# ============================================
# 3. 安装 Cloudflare Wrangler CLI
# ============================================
Write-Host "[3/3] 正在安装 Cloudflare Wrangler CLI..." -ForegroundColor Green

# 安装 Wrangler CLI
Write-Host "  正在安装 wrangler (全局)..." -ForegroundColor Gray
npm install -g wrangler

if ($LASTEXITCODE -eq 0) {
    Write-Host "  ✅ Cloudflare Wrangler CLI 安装完成" -ForegroundColor Green
} else {
    Write-Host "  ❌ Cloudflare Wrangler CLI 安装失败" -ForegroundColor Red
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  安装完成！" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📦 已安装组件：" -ForegroundColor Yellow
Write-Host "  1. CC Switch - AI 编程 CLI 统一管理工具" -ForegroundColor White
Write-Host "  2. OpenAI Codex CLI - OpenAI 官方命令行编程助手" -ForegroundColor White
Write-Host "  3. Cloudflare Wrangler CLI - Cloudflare Workers 部署工具" -ForegroundColor White
Write-Host ""
Write-Host "🚀 快速开始：" -ForegroundColor Yellow
Write-Host "  • 启动 CC Switch: 从开始菜单启动" -ForegroundColor White
Write-Host "  • 使用 Codex: codex login" -ForegroundColor White
Write-Host "  • 使用 Wrangler: wrangler login" -ForegroundColor White
Write-Host ""
Write-Host "📚 详细文档：" -ForegroundColor Yellow
Write-Host "  • CC Switch: https://ccswitch.ai/zh/" -ForegroundColor Cyan
Write-Host "  • Codex CLI: https://developers.openai.com/codex/cli" -ForegroundColor Cyan
Write-Host "  • Wrangler CLI: https://developers.cloudflare.com/workers/wrangler/" -ForegroundColor Cyan
Write-Host ""

# 暂停以便查看结果
Write-Host "按任意键退出..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
