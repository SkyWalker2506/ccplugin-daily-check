#!/bin/bash
set -euo pipefail

echo "🔍 ccplugin-daily-check install check..."

# Check if daily-check.sh exists (installed via claude-config)
DAILY_CHECK_SCRIPT="$HOME/.claude/config/daily-check.sh"
WATCHDOG_DIR="$HOME/.watchdog"

if [ ! -f "$DAILY_CHECK_SCRIPT" ]; then
  echo "⚠️  WARNING: $DAILY_CHECK_SCRIPT not found."
  echo "   This plugin requires claude-config to be installed first."
  echo "   Run: cd ~/Projects/claude-config && bash ./install.sh"
  echo ""
  echo "   After claude-config is installed, re-run this script."
  MISSING_SCRIPT=1
else
  echo "✅ daily-check.sh found at $DAILY_CHECK_SCRIPT"
  MISSING_SCRIPT=0
fi

# Create watchdog directory if missing
if [ ! -d "$WATCHDOG_DIR" ]; then
  mkdir -p "$WATCHDOG_DIR"
  echo "✅ Created $WATCHDOG_DIR"
else
  echo "✅ $WATCHDOG_DIR exists"
fi

if [ "${MISSING_SCRIPT:-0}" = "1" ]; then
  echo ""
  echo "❌ Install incomplete — claude-config required."
  exit 1
fi

echo ""
echo "✅ ccplugin-daily-check ready!"
echo "Run: /daily-check"
echo "Or:  bash $DAILY_CHECK_SCRIPT"
