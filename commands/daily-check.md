---
description: Run a daily system health check — Ollama, MCP, API keys, disk, RAM, token usage
allowed-tools: [Bash]
---

# Daily Health Check

Run the system health check script.

## Instructions

Execute: `bash ~/.claude/config/daily-check.sh`

If the script doesn't exist, inform the user to run `./install.sh` in their claude-config repo.

Report the results clearly, highlighting any failures or warnings.

## Agent Registry Check (CC-14)

As part of the daily check, verify the agent registry is in sync:

```bash
cd ~/Projects/claude-config && python3 scripts/sync_agents.py --check
```

If `sync_agents.py` reports drift (agents out of sync, missing entries, or schema mismatches), include a warning in the daily report and suggest running `sync_agents.py` without `--check` to apply fixes.

## Session Auto-Trigger (CC-15)

This skill auto-triggers at session start if the last check was more than 24 hours ago.

Check logic:
```bash
LAST_CHECK=$(cat ~/.watchdog/daily_report.json 2>/dev/null | python3 -c "import sys,json,time; d=json.load(sys.stdin); print(d.get('timestamp', 0))" 2>/dev/null || echo 0)
NOW=$(date +%s)
DIFF=$((NOW - LAST_CHECK))
if [ "$DIFF" -gt 86400 ]; then
  echo "TRIGGER: last check was more than 24h ago — running daily-check"
  bash ~/.claude/config/daily-check.sh
fi
```

If `~/.watchdog/daily_report.json` does not exist or the `timestamp` field is older than 86400 seconds, auto-run the check and notify the user.
