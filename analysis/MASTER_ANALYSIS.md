# ccplugin-daily-check — Master Analysis

**Date:** 2026-04-22  
**Analyst:** Forge/Jarvis  
**Version:** 1.0.0

---

## 1. Project Overview

Daily system health check plugin for Claude Code. Checks Ollama status, MCP servers, API keys, disk/RAM usage, and token cost. Reports to `~/.watchdog/` and can send Telegram alerts. Auto-triggers at session start if last check was >24h ago.

**Stack:** Bash, Markdown (command + skill), Claude Code plugin system  
**Dependencies:** `~/.claude/config/daily-check.sh` (from claude-config), optional Telegram bot, optional cron

---

## 2. Current State

### Files
| File | Purpose | Quality |
|------|---------|---------|
| `commands/daily-check.md` | `/daily-check` command | Good — YAML frontmatter, agent registry check (CC-14), auto-trigger (CC-15) |
| `skills/daily-check/SKILL.md` | Skill definition | Good — trigger phrases, version, description |
| `.claude-plugin/plugin.json` | Plugin metadata | Present |
| `README.md` | Plugin readme | Solid — table of checks, cron, alerts, links |
| `LICENSE` | MIT | Present |
| `CLAUDE.md` | Project rules | Present |

### Strengths
- Well-documented command with CC-14 (agent registry) and CC-15 (auto-trigger) features
- Skill has clear trigger phrases
- README quality is high with good structure
- Integration with watchdog log system

### Issues Found
1. **`daily-check.sh` itself not included in repo** — the script lives in `claude-config`, not this plugin; the command just calls it. If `claude-config` is not installed, the plugin silently fails with only a message to run `./install.sh`
2. **No `install.sh`** — unlike clipboard plugin, no install script to set up dependencies or validate `daily-check.sh` exists
3. **No skills directory registration** — `plugin.json` may not reference the skill
4. **CC-15 auto-trigger** references session hooks but no hook configuration documented
5. **Telegram alert setup** not documented in README's install section — users won't know how to configure it
6. **No test for the check logic** — no way to validate the plugin works without a full claude-config install
7. **Agent registry check (CC-14)** references `sync_agents.py` path hardcoded — brittle if path changes
8. **`.claude-plugin/plugin.json`** likely missing `skills` field — check needed
9. **`CLAUDE.md`** may be a generic redirector, not project-specific
10. **No `.gitignore`** — `.DS_Store` is untracked

---

## 3. Gap Analysis

| Area | Gap | Priority |
|------|-----|---------|
| Install | No `install.sh` to validate dependencies | High |
| Plugin metadata | `plugin.json` may be missing `skills` field | High |
| Documentation | Telegram alert config not in install docs | Medium |
| Resilience | Hard dependency on `claude-config` install not surfaced gracefully | Medium |
| Testing | No smoke test / self-check for the skill | Medium |
| Housekeeping | `.gitignore` missing | Low |

---

## 4. Recommended Sprint Structure

### Sprint 1 — Foundation Fixes
- Read and audit `plugin.json` — add `skills` field if missing
- Create `install.sh` that validates `daily-check.sh` exists and warns if not
- Add `.gitignore`

### Sprint 2 — Documentation & UX
- Document Telegram alert setup in README
- Add troubleshooting section to README (what to do if `daily-check.sh` missing)
- Improve skill trigger phrases — add "disk space", "RAM check", "health"

### Sprint 3 — Polish
- Add `version` bumped to `1.1.0` in `plugin.json` and `SKILL.md`
- Add example output to README showing a sample daily report
- Ensure CC-15 auto-trigger is documented in README's Auto-Schedule section
