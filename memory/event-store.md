---
name: event-store
description: "Where hook events are logged (skogai-core plugin), the row shape, and which fields identify subagents"
metadata:
  type: reference
---

Writer: the skogai-core plugin (0.10.0, `~skogix/.claude/plugins/cache/skogai-marketplace/skogai-core/0.10.0/`). Off in skogix's user settings, on for everything under `~skogix/Work` via `~skogix/Work/.claude/settings.json:3`. Options in `~skogix/.claude/settings.json:150-167` (`events:"*"`, `log_path`, `journal_path`, `state_dir`, auto stage/commit/merge).

- Subscribes to 13 hook events (`hooks/hooks.json`), each runs `scripts/events/<Event>.sh`.
- Row: `{ts, event, action?, input: <raw hook stdin>}`, written under `flock` by `scripts/append-json.sh:15-25`.
- Paths are relative to the **git root of the event's cwd** (`scripts/settings.sh:24-36`): one `.skogai/logs/log.jsonl` per repo, no global log.
- Journal: `scripts/events/Stop.sh:36-58` folds a turn's rows (by `prompt_id`) into a markdown section in `.skogai/logs/journal.md`; `scripts/git-steps.sh:27` commits it as "skogai-core: journal".

Fields on every row: `session_id`, `transcript_path`, `cwd`, `prompt_id`, `hook_event_name`. Tool events add `tool_name`, `tool_input`, `tool_use_id`; Post adds `duration_ms` and `tool_response` or `error`.

Subagents are identifiable: `SubagentStart`/`SubagentStop` carry `agent_id` and `agent_type` (Stop also `agent_transcript_path`, `last_assistant_message`); tool events fired inside a subagent carry `agent_id`/`agent_type`; the spawning `Agent` PreToolUse has `tool_input.subagent_type`. Verified in `~skogix/Work/.skogai/logs/log.jsonl` (2026-11-15).
