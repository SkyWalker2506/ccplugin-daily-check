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
