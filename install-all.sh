#!/bin/bash
# AI Coding Toolkit - macOS/Linux 一键安装脚本
# 包含：CC Switch + OpenAI Codex CLI + Cloudflare Wrangler CLI + Claude Code

set -e

echo "========================================"
echo "   AI Coding Toolkit - 安装器"
echo "========================================"
echo ""

# 检测操作系统
OS="unknown"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
fi

echo "检测到操作系统: $OS"
echo ""

# ============================================
# 1. 安装 CC Switch
# ============================================
echo "[1/4] 正在安装 CC Switch..."

if [[ "$OS" == "macos" ]]; then
    # macOS - 使用 Homebrew
    if ! command -v brew &> /dev/null; then
        echo "  ❌ 未检测到 Homebrew，请先安装: https://brew.sh/"
        exit 1
    fi

    echo "  使用 Homebrew 安装..."
    brew tap farion1231/ccswitch
    brew install --cask cc-switch

    if [ $? -eq 0 ]; then
        echo "  ✅ CC Switch 安装完成"
    else
        echo "  ❌ CC Switch 安装失败"
    fi

elif [[ "$OS" == "linux" ]]; then
    # Linux - 检测发行版
    if command -v paru &> /dev/null; then
        echo "  检测到 Arch Linux，使用 paru 安装..."
        paru -S cc-switch-bin --noconfirm
    else
        echo "  请手动下载安装包:"
        echo "  https://github.com/farion1231/cc-switch/releases/latest"
        echo ""
        echo "  支持的格式: .deb, .rpm, .AppImage"
    fi
else
    echo "  ❌ 不支持的操作系统: $OS"
    exit 1
fi

echo ""

# ============================================
# 2. 检查 Node.js（Codex、Wrangler、Claude Code 都需要）
# ============================================
echo "[2/4] 检查 Node.js 环境..."

if ! command -v node &> /dev/null; then
    echo "  ❌ 未检测到 Node.js，请先安装: https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node --version)
echo "  ✅ 检测到 Node.js: $NODE_VERSION"

# 检查 Node.js 版本（Claude Code 需要 20+）
NODE_MAJOR=$(node --version | cut -d'.' -f1 | sed 's/v//')
if [ "$NODE_MAJOR" -lt 20 ]; then
    echo "  ⚠️  Node.js 版本过低，Claude Code 需要 20+"
    echo "  请升级 Node.js: https://nodejs.org/"
    echo "  或安装 nvm: https://github.com/nvm-sh/nvm"
fi

echo ""

# ============================================
# 3. 安装 OpenAI Codex CLI
# ============================================
echo "[3/4] 正在安装 OpenAI Codex CLI..."

echo "  正在安装 @openai/codex (全局)..."
npm install -g @openai/codex

if [ $? -eq 0 ]; then
    echo "  ✅ OpenAI Codex CLI 安装完成"
else
    echo "  ❌ OpenAI Codex CLI 安装失败"
fi

echo ""

# ============================================
# 4. 安装 Cloudflare Wrangler CLI
# ============================================
echo "[4/4] 正在安装 Cloudflare Wrangler CLI..."

echo "  正在安装 wrangler (全局)..."
npm install -g wrangler

if [ $? -eq 0 ]; then
    echo "  ✅ Cloudflare Wrangler CLI 安装完成"
else
    echo "  ❌ Cloudflare Wrangler CLI 安装失败"
fi

echo ""

# ============================================
# 5. 安装 Claude Code CLI
# ============================================
echo "[5/5] 正在安装 Claude Code CLI..."

echo "  正在安装 @anthropic-ai/claude-code (全局)..."
npm install -g @anthropic-ai/claude-code

if [ $? -eq 0 ]; then
    echo "  ✅ Claude Code CLI 安装完成"
    echo ""
    echo "  ⚙️  配置 Claude Code (国内网络适配):"
    echo "  1. 创建配置文件: ~/.claude/settings.json"
    echo "  2. 填入你的 API 配置 (参考 README.md)"
else
    echo "  ❌ Claude Code CLI 安装失败"
fi

echo ""
echo "========================================"
echo "  安装完成！"
echo "========================================"
echo ""
echo "📦 已安装组件："
echo "  1. CC Switch - AI 编程 CLI 统一管理工具"
echo "  2. OpenAI Codex CLI - OpenAI 官方命令行编程助手"
echo "  3. Cloudflare Wrangler CLI - Cloudflare Workers 部署工具"
echo "  4. Claude Code CLI - Anthropic 官方 AI 编程助手"
echo ""
echo "🚀 快速开始："
echo "  • 启动 CC Switch: 从应用程序文件夹启动 (macOS) 或开始菜单 (Windows)"
echo "  • 使用 Codex: codex login"
echo "  • 使用 Wrangler: wrangler login"
echo "  • 使用 Claude Code: claude (需先配置 API)"
echo ""
echo "📚 详细文档："
echo "  • CC Switch: https://ccswitch.ai/zh/"
echo "  • Codex CLI: https://developers.openai.com/codex/cli"
echo "  • Wrangler CLI: https://developers.cloudflare.com/workers/wrangler/"
echo "  • Claude Code: https://docs.anthropic.com/claude-code"
echo ""
echo "📖 Claude Code 国内配置 (使用 GLM API 代理):"
echo "  参考 README.md 中 'Claude Code 国内配置' 章节"
echo ""
