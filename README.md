# daily-check — Claude Code Plugin

Daily system health check — Ollama models, MCP servers, API keys, disk/RAM usage, token cost report.

## Install

```bash
claude plugin install daily-check@SkyWalker2506-claude-plugins
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

[SkyWalker2506/claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code
