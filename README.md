# AI Coding Toolkit

<div align="center">

**一键安装 CC Switch + OpenAI Codex CLI + Cloudflare Wrangler CLI**

[![GitHub release](https://img.shields.io/github/v/release/10HQ/ai-coding-toolkit)](https://github.com/10HQ/ai-coding-toolkit/releases)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)]()
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)

</div>

---

## 📦 包含工具

| 工具 | 功能 | 官网 |
|------|------|------|
| **CC Switch** | AI 编程 CLI 统一管理台（Claude Code / Codex / Gemini CLI / OpenClaw 等） | [ccswitch.ai](https://ccswitch.ai/zh/) |
| **OpenAI Codex CLI** | OpenAI 官方命令行 AI 编程助手 | [openai.com/codex](https://openai.com/codex) |
| **Cloudflare Wrangler CLI** | Cloudflare Workers 开发与部署工具 | [developers.cloudflare.com](https://developers.cloudflare.com/workers/wrangler/) |

---

## 🚀 快速安装

### Windows

```powershell
# 右键"以管理员身份运行" PowerShell，然后执行：
.\install-all.ps1
```

或者下载发行版，双击 `install-all.ps1` 运行。

### macOS / Linux

```bash
# 克隆仓库
git clone https://github.com/10HQ/ai-coding-toolkit.git
cd ai-coding-toolkit

# 运行安装脚本
bash install-all.sh
```

---

## 🔧 工具说明

### 1. CC Switch

**统一管理多个 AI 编程 CLI 的工具**，支持：
- ✅ Claude Code
- ✅ OpenAI Codex CLI
- ✅ Gemini CLI
- ✅ OpenCode
- ✅ OpenClaw
- ✅ Hermes Agent

**功能亮点**：
- 供应商配置统一管理
- MCP / Prompts / Skills 管理
- 代理接管
- 会话搜索与同步
- 用量统计

**使用方式**：
- Windows: 开始菜单启动 `CC Switch`
- macOS: `brew install --cask cc-switch`
- Linux: 下载对应安装包

---

### 2. OpenAI Codex CLI

OpenAI 官方推出的**命令行 AI 编程助手**。

**核心功能**：
- 代码生成与解释
- Bug 自动修复
- 项目级代码重构
- 终端内直接运行

**快速开始**：
```bash
# 登录认证
codex login

# 启动交互模式
codex

# 单次提问
codex "帮我写一个 React 组件"
```

**配置文件位置**：`~/.codex/`

---

### 3. Cloudflare Wrangler CLI

Cloudflare Workers 的**官方开发与部署工具**。

**核心功能**：
- 本地开发 Cloudflare Workers
- 部署到全球边缘网络
- 管理 Workers 脚本与环境变量
- 集成 Cloudflare Pages / R2 / D1 等服务

**快速开始**：
```bash
# 登录认证
wrangler login

# 初始化项目
wrangler init my-worker

# 本地开发
wrangler dev

# 部署
wrangler deploy
```

**配置文件**：`wrangler.toml`

---

## 📚 使用场景

### 场景 1：多 AI 编程工具切换
使用 **CC Switch** 统一管理多个 AI 编程 CLI 的供应商配置、API Key、MCP 服务器等。

### 场景 2：本地 AI 辅助编程
使用 **Codex CLI** 在终端中直接与 AI 对话，生成代码、修复 Bug。

### 场景 3：快速部署到 Cloudflare
使用 **Wrangler CLI** 将代码部署到 Cloudflare Workers，享受全球边缘网络加速。

### 场景 4：完整工作流
1. 用 **Codex CLI** 生成代码
2. 用 **CC Switch** 管理不同 AI 工具的配置
3. 用 **Wrangler CLI** 一键部署到 Cloudflare

---

## 🛠️ 手动安装（分步骤）

### 安装 CC Switch

**Windows**:
1. 访问 [GitHub Releases](https://github.com/farion1231/cc-switch/releases/latest)
2. 下载 `CC-Switch-Setup-*.msi`
3. 双击安装

**macOS**:
```bash
brew tap farion1231/ccswitch
brew install --cask cc-switch
```

**Linux**:
- Arch: `paru -S cc-switch-bin`
- 其他发行版: 下载 `.deb` / `.rpm` / `.AppImage`

### 安装 Codex CLI

```bash
npm install -g @openai/codex
```

### 安装 Wrangler CLI

```bash
npm install -g wrangler
```

---

## 📋 系统要求

- **Node.js**: >= 18.0.0（Codex CLI 和 Wrangler CLI 需要）
- **PowerShell**: >= 5.1（Windows 安装脚本需要）
- **网络连接**: 需要访问 GitHub 和对应服务的 API

---

## 🐛 常见问题

### Q: CC Switch 安装失败？
A: 手动从 [GitHub Releases](https://github.com/farion1231/cc-switch/releases/latest) 下载安装包。

### Q: Codex CLI 安装后无法运行？
A: 检查 Node.js 版本（`node --version`），确保 >= 18.0.0。同时需要配置 OpenAI API Key。

### Q: Wrangler CLI 部署失败？
A: 确保已运行 `wrangler login` 完成认证。

---

## 📖 相关文档

- [CC Switch 官方文档](https://ccswitch.ai/zh/)
- [Codex CLI 文档](https://developers.openai.com/codex/cli)
- [Wrangler CLI 文档](https://developers.cloudflare.com/workers/wrangler/)

---

## 📄 License

[MIT License](LICENSE)

---

<div align="center">

**⭐ 如果这个项目对你有帮助，请给个 Star！**

Made with ❤️ by [10HQ](https://github.com/10HQ)

</div>
