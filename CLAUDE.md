# ccplugin-daily-check

> See global rules: `~/Projects/claude-config/CLAUDE.md`

## Project

Daily system health check plugin for Claude Code.

**Repo:** https://github.com/SkyWalker2506/ccplugin-daily-check  
**Version:** 1.2.0

## Commands

- `/daily-check` — run health check now
- `/daily-check-reset` — clear cached report + run fresh check

## Key Files

- `commands/daily-check.md` — main command with pre-flight checks + CC-14/CC-15
- `commands/daily-check-reset.md` — reset command
- `skills/daily-check/SKILL.md` — auto-trigger skill (CC-15)
- `.claude-plugin/plugin.json` — plugin metadata
- `install.sh` — validates dependencies (requires claude-config)

## External Dependencies

- `~/.claude/config/daily-check.sh` — script from claude-config repo
- `~/.watchdog/` — output directory for reports and logs
- Optional: `TELEGRAM_BOT_TOKEN` + `TELEGRAM_CHAT_ID` in secrets.env

## Design Decision

This plugin is a thin wrapper around `daily-check.sh` from claude-config.
The script is not duplicated here to avoid divergence.
