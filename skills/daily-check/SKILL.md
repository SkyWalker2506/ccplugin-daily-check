---
name: daily-check
description: "This skill activates when the user asks about: system health, daily check, Ollama status, MCP health, disk usage, disk space, RAM check, available memory, token budget, token usage, API keys working, is everything running, health status, check system. Also triggers at session start if the last check was more than 24 hours ago (CC-15: auto-trigger when ~/.watchdog/daily_report.json timestamp > 24h old or missing)."
version: 1.1.0
---

# Daily Health Check Skill

Automated daily system health monitoring for Claude Code setups.

## Trigger Phrases

| Intent | Phrases | Routes To |
|--------|---------|-----------|
| Full check | daily check, system health, is everything running, health status | `/daily-check` |
| Ollama | ollama status, is ollama running, ollama models | `/daily-check` |
| MCP | MCP health, MCP status, are MCPs working | `/daily-check` |
| Disk | disk usage, disk space, how much disk | `/daily-check` |
| RAM | RAM check, available memory, how much memory | `/daily-check` |
| Tokens | token budget, token usage, API usage | `/daily-check` |
| API Keys | API keys working, are keys valid | `/daily-check` |

## What It Checks

| Component | Check |
|-----------|-------|
| Ollama | Running, models loaded, response time |
| MCP Servers | Connected, responding |
| API Keys | Claude, OpenRouter, GitHub, Telegram |
| Disk | Usage % on home drive |
| RAM | Available memory |
| Token Usage | Claude API usage vs quota |
| Agent Registry | `sync_agents.py --check` — drift detection |

## Report Location

Results saved to `~/.watchdog/daily_report.json` and logged in `~/.watchdog/daily.log`.

## Auto-Schedule

If cron is set up (via install.sh Phase 11), runs daily at 09:00:
```
0 9 * * * bash ~/.claude/config/daily-check.sh >> ~/.watchdog/daily.log 2>&1
```

## Running Manually

```bash
/daily-check
# or:
bash ~/.claude/config/daily-check.sh
```

## Alerts

If critical issues found (Ollama down, API key expired, disk >90%):
- Sends Telegram notification if bot is running
- Logs to `~/.watchdog/alerts.log`
