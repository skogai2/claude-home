---
name: home-folder-bootstrap
description: The home is being redefined from scratch for tens of homes (user@host, containers); repo stripped to intents + memory on 2026-11-11
metadata:
  type: project
---

The first build (started 2026-10-14) declared one home, `~claude` on skogix-workstation, with mise bootstrap. On 2026-11-11 Emil and I stripped the repo (skogai2/claude-home) down to CLAUDE.md and memory/ to redefine "what a home needs" first, because there are now tens of real machines, user+home setups and containers. The old build is in git history up to caa5818.

A home = one user on one host. `hc` (herdr-core) addresses each as a machine: `hc run --on <machine> <cmd|template> [task]`. "claude-workstation" is the `claude` user on skogix-workstation, not another box. hc launches start with a clean env (no CLAUDE*/HERDR* leak from the launcher). Templates (frontmatter `type: template`, `command:`, body = brief) live in `~/.config/herdr-core/templates/`. `herdr server` still runs, but it is session-managed under the launching user (skogix), whereas hc runs work as the target home's own user.

**Why:** a single-home declaration can't describe or detect drift across many homes; tools were "latest", and env leaked between sessions.
**How to apply:** define each need in CLAUDE.md ("what a home needs") as intent before building anything. Memory across homes is the open hard problem; settle it first. See [[skogfences]].

Still open from the first build: a GitHub identity per agent (gh used Emil's token), shared ssh-agent with human-approved signing, /skogai permissions proposal (Emil's call).
