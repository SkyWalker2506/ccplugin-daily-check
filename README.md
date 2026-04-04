# daily-check — Claude Code Plugin

by [Musab Kara](https://linkedin.com/in/musab-kara-85580612a) · [GitHub](https://github.com/SkyWalker2506)

Daily system health check — Ollama models, MCP servers, API keys, disk/RAM usage, token cost report.

## Install

```bash
claude plugin install daily-check@musabkara-claude-marketplace
```

## Commands

| Command | Description |
|---------|-------------|
| `/daily-check` | Run health check now |

## What It Checks

- Ollama: running, models loaded, response time
- MCP servers: connected, responding
- API keys: Claude, OpenRouter, GitHub, Telegram
- Disk/RAM usage
- Claude token quota remaining

## Part of

- [claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code (110 agents, local-first routing)
- [Plugin Marketplace](https://github.com/SkyWalker2506/claude-marketplace) — Browse & install all 14 plugins
