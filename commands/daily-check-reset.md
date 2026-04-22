---
description: Reset the daily check report, forcing a fresh check on next session start.
allowed-tools: [Bash]
---

# /daily-check-reset

Clear the cached daily report and run a fresh health check now.

## Instructions

```bash
# Remove cached report
REPORT="$HOME/.watchdog/daily_report.json"
if [ -f "$REPORT" ]; then
  rm "$REPORT"
  echo "✅ Daily report cleared."
else
  echo "ℹ️  No cached report found (already fresh)."
fi
```

Then immediately run a fresh check:

```bash
bash ~/.claude/config/daily-check.sh
```

Report the results to the user.
