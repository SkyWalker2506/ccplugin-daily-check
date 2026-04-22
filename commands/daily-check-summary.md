---
description: Show the last daily check report without running a new check.
allowed-tools: [Bash]
---

# /daily-check-summary

Show the results of the last health check without running a new one.

## Instructions

```bash
REPORT="$HOME/.watchdog/daily_report.json"

if [ ! -f "$REPORT" ]; then
  echo "No daily report found. Run /daily-check to generate one."
  exit 0
fi

# Show timestamp
TIMESTAMP=$(python3 -c "
import json, datetime
with open('$REPORT') as f:
    d = json.load(f)
ts = d.get('timestamp', 0)
dt = datetime.datetime.fromtimestamp(ts)
print(dt.strftime('%Y-%m-%d %H:%M:%S'))
" 2>/dev/null || echo "unknown")

echo "Last check: $TIMESTAMP"
echo ""

# Pretty-print the report
python3 -c "
import json
with open('$REPORT') as f:
    d = json.load(f)
checks = d.get('checks', {})
for component, result in checks.items():
    status = result.get('status', '?')
    icon = '✅' if status == 'ok' else '❌'
    print(f'{icon} {component}: {status}')
" 2>/dev/null || cat "$REPORT"
```
