---
name: home-folder-bootstrap
description: Goal and status of building the claude user's home declaratively with mise bootstrap; how-to lives in ~/.claude/CLAUDE.md
metadata:
  type: project
---

Emil is building the claude user's home from scratch, ansible-style, with mise (repo ~/.config/mise → skogai2/claude-home). Started 2026-10-14. The how-to and gotchas are in ~/.claude/CLAUDE.md (managed in that repo), so don't repeat them here.

End goal (stated 2026-10-15): wake-on-LAN brings up the claude user's services on its own (linger is done), running `herdr server` plus similar podman setups, all declared in mise bootstrap. Eventually the home should also work as a "container + git pull" setup.

Open items as of 2026-10-15:
- herdr server as a user service (herdr comes from the OS for now; the server was a stale 0.9.1 started by the remote bridge)
- GitHub App per agent to replace Emil's personal gh token
- sticky-bit / 2755 permissions proposal for /skogai (Emil's call)
- `[bootstrap.user] login_shell` and `[bootstrap.mise_shell_activate]` hints from Emil, not applied yet; check how they edit a symlinked .bashrc first
- shared ssh-agent with human-approved signing (`ssh-add -c` + askpass), see [[skogfences]]
