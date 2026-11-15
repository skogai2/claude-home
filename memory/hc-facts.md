---
name: hc-facts
description: "herdr-core (hc) facts verified 2026-11-15: run grammar, JSON shapes, templates, why agents start in ~/Work"
metadata:
  type: reference
---

- Grammar: `hc run [OPTIONS] [ARGV]...`; ARGV is a program and its args, or a template name and its task. Put every flag **before** the program; whether a flag after the task is parsed by hc is untested.
- `--cwd` defaults to that machine's home with `--on`. `--name` is 1-32 of `a-z 0-9 - _`. Children die with their parent unless `--outlive-parent`.
- `hc get <t>`: `status.{app,state,msg}`, `turn`, `labels` (`herdr.space`, `herdr.tab`, `where`), `template`, `records` (sub-agents: `{app,state,title}`), `foreground.{argv,cwd,name,pid}`. No top-level `agent`; the agent is `status.app`.
- `hc ls`: `terminals[].{address,agent,cwd,state,status,turn,where}`; `status` is a plain string and absent for plain programs.
- Status values come from OSC 7501: `idle`, `working`, `done`, `blocked`, `error` (`~skogix/.config/herdr-app/AGENTS.md:153-156`).
- Templates: `~/.config/herdr-core/templates/<name>.md`, frontmatter `type: template`, `name`, `description`, `command`; the body is the brief. Unknown: whether `--on M <template>` reads M's templates.
- `claude-workstation` is the hc machine for my user on skogix-workstation, `keeps_running_after_logout: true`, linger user `claude`.
- **Why `~/Work`:** Claude Code asks for permission on everything when started in a flat home directory, even its own. Agents in a home start in `<home>/Work`.
