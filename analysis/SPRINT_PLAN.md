# ccplugin-daily-check — Sprint Plan

**Date:** 2026-04-22  
**Forge Run:** 1  
**Sprints:** 3 × max 5 tasks

---

## Sprint 1 — Foundation Fixes

| # | Task | Type | Est |
|---|------|------|-----|
| 1 | Add `skills` and `commands` arrays to `plugin.json` | fix | 10min |
| 2 | Fix `homepage` and `repository` URLs in `plugin.json` (currently point to wrong repos) | fix | 5min |
| 3 | Create `install.sh` — validate `daily-check.sh` exists, warn gracefully if not | feat | 20min |
| 4 | Add `.gitignore` (`.DS_Store`, `*.log`) | chore | 5min |

**Goal:** Plugin metadata complete and accurate; install validation in place.

---

## Sprint 2 — Documentation & UX

| # | Task | Type | Est |
|---|------|------|-----|
| 1 | Add Telegram alert setup instructions to README | docs | 15min |
| 2 | Add troubleshooting section to README (missing `daily-check.sh`, missing watchdog dir) | docs | 10min |
| 3 | Expand SKILL.md trigger phrases: add "disk space", "RAM check", "health status", "token usage" | fix | 5min |
| 4 | Update `commands/daily-check.md` — add fallback if `~/.watchdog/` doesn't exist | fix | 10min |

**Goal:** Users can self-diagnose and set up Telegram alerts without external docs.

---

## Sprint 3 — Polish

| # | Task | Type | Est |
|---|------|------|-----|
| 1 | Bump version to `1.1.0` in `plugin.json` and `SKILL.md` | chore | 3min |
| 2 | Add example daily report output (JSON snippet) to README | docs | 10min |
| 3 | Document CC-15 auto-trigger behavior in README Auto-Schedule section | docs | 10min |
| 4 | Final git commit with clean history | chore | 5min |

**Goal:** Repository is production-ready with complete documentation.
