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
| `/daily-check-reset` | Clear cached report + run fresh check |

## What It Checks

| Component | Check |
|-----------|-------|
| Ollama | Running, models loaded, response time |
| MCP Servers | Connected, responding |
| API Keys | Claude, OpenRouter, GitHub, Telegram |
| Disk | Usage % on home drive |
| RAM | Available memory |
| Token Usage | Claude API usage vs quota |
| Agent Registry | Agent sync status (`sync_agents.py --check`) |

## Auto-Schedule

If cron is set up (via `install.sh` Phase 11), runs daily at 09:00:

```
0 9 * * * bash ~/.claude/config/daily-check.sh >> ~/.watchdog/daily.log 2>&1
```

## Alerts

If critical issues are found (Ollama down, API key expired, disk >90%):
- Sends Telegram notification if bot is configured
- Logs to `~/.watchdog/alerts.log`

## Reports

Results saved to `~/.watchdog/daily_report.json` and logged in `~/.watchdog/daily.log`.

## Part of

- [claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code (134 agents, local-first routing)
- [Plugin Marketplace](https://github.com/SkyWalker2506/claude-marketplace) — Browse & install all 18 plugins
- [ClaudeHQ](https://github.com/SkyWalker2506/ClaudeHQ) — Claude ecosystem HQ

## Telegram Alert Setup

To receive alerts when critical issues are found:

1. Create a Telegram bot via [@BotFather](https://t.me/BotFather)
2. Get your chat ID via [@userinfobot](https://t.me/userinfobot)
3. Add to `~/.claude/secrets/secrets.env`:
   ```
   TELEGRAM_BOT_TOKEN=your-bot-token
   TELEGRAM_CHAT_ID=your-chat-id
   ```
4. `daily-check.sh` reads these automatically

## Troubleshooting

| Problem | Solution |
|---------|---------|
| `daily-check.sh not found` | Run `cd ~/Projects/claude-config && bash ./install.sh` first |
| `~/.watchdog/ not found` | Run `bash install.sh` in this plugin's directory |
| Ollama check fails | Ensure Ollama is running: `ollama serve` |
| `sync_agents.py` not found | Run `cd ~/Projects/claude-config && git pull` |

## Example Report

Sample `~/.watchdog/daily_report.json`:

```json
{
  "timestamp": 1745312400,
  "date": "2026-04-22T09:00:00",
  "status": "ok",
  "checks": {
    "ollama": {"status": "ok", "models": ["llama3.2", "qwen3"], "response_ms": 142},
    "mcp": {"status": "ok", "servers": ["github", "atlassian", "git"]},
    "api_keys": {"claude": "ok", "github": "ok", "openrouter": "missing"},
    "disk": {"status": "ok", "usage_pct": 67},
    "ram": {"status": "ok", "available_gb": 12.4},
    "token_usage": {"status": "ok", "used": 42000, "limit": 100000},
    "agent_registry": {"status": "ok", "drift": false}
  }
}
```

## Session Auto-Trigger (CC-15)

At session start, Claude checks if the last daily report is older than 24 hours:

- Report exists and is fresh → no action
- Report is >24h old or missing → auto-run `daily-check.sh` and show results

To force a fresh check (reset the 24h timer), delete the report:

```bash
rm ~/.watchdog/daily_report.json
```

Then start a new Claude session — the check will run automatically.
