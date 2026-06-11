#!/bin/bash
# AI Coding Toolkit - macOS/Linux 一键安装脚本
# 包含：CC Switch + OpenAI Codex CLI + Cloudflare Wrangler CLI

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
echo "[1/3] 正在安装 CC Switch..."

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
        exit 1
    fi
else
    echo "  ❌ 不支持的操作系统: $OS"
    exit 1
fi

echo ""

# ============================================
# 2. 安装 OpenAI Codex CLI
# ============================================
echo "[2/3] 正在安装 OpenAI Codex CLI..."

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo "  ❌ 未检测到 Node.js，请先安装: https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node --version)
echo "  检测到 Node.js: $NODE_VERSION"

echo "  正在安装 @openai/codex (全局)..."
npm install -g @openai/codex

if [ $? -eq 0 ]; then
    echo "  ✅ OpenAI Codex CLI 安装完成"
else
    echo "  ❌ OpenAI Codex CLI 安装失败"
    exit 1
fi

echo ""

# ============================================
# 3. 安装 Cloudflare Wrangler CLI
# ============================================
echo "[3/3] 正在安装 Cloudflare Wrangler CLI..."

echo "  正在安装 wrangler (全局)..."
npm install -g wrangler

if [ $? -eq 0 ]; then
    echo "  ✅ Cloudflare Wrangler CLI 安装完成"
else
    echo "  ❌ Cloudflare Wrangler CLI 安装失败"
    exit 1
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
echo ""
echo "🚀 快速开始："
echo "  • 启动 CC Switch: 从应用程序文件夹启动 (macOS) 或开始菜单 (Windows)"
echo "  • 使用 Codex: codex login"
echo "  • 使用 Wrangler: wrangler login"
echo ""
echo "📚 详细文档："
echo "  • CC Switch: https://ccswitch.ai/zh/"
echo "  • Codex CLI: https://developers.openai.com/codex/cli"
echo "  • Wrangler CLI: https://developers.cloudflare.com/workers/wrangler/"
echo ""
