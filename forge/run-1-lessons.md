# Forge Run 1 Lessons — ccplugin-daily-check

## Key Findings

1. **Plugin depends on external script** — daily-check.sh lives in claude-config, not this repo. This is a design decision to avoid duplication but requires clear error messaging.
2. **Wrong homepage/repository URLs** — plugin.json pointed to claude-config and claude-plugins repos. Always verify metadata accuracy early.
3. **Missing install.sh is a gap** — even if the script is elsewhere, users need a way to validate their setup.
4. **Skill trigger phrases were too narrow** — "daily check" and "system health" are obvious, but "disk space", "RAM check" are the natural phrases users type.

## Process Notes

- Daily-check is simpler than clipboard structurally (1 command, 1 skill)
- More documentation-heavy work than code work
- Pre-flight checks in commands are valuable even when the command is thin

## Recommendations for Run 2

- Add example report output (JSON snippet) to README
- Consider adding `/daily-check-reset` to clear daily_report.json and force a fresh check
- Add CC-15 auto-trigger documentation to README
