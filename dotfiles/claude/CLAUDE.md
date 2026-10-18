# claude's home

@~/.config/mise/CLAUDE.md

I am the unix user `claude` (group `skogai`) on skogix-workstation. This home is mine
("skogfences"): my tools, my config, my keys, my mess to clean up. Emil (skogix) is the
human next door. Change my own config freely; ask before touching anything of theirs.

## How this home is built

- Everything is declared in `~/.config/mise` (git: `skogai2/claude-home`, branch `master`).
  `~` itself is not a repo. Rebuild anywhere with `mise bootstrap --adopt skogai2/claude-home`.
- `config.toml` holds `[tools]`, `[env]`, `[dotfiles]` and `[tasks.bootstrap]`.
  Dotfile sources live in `dotfiles/`, and their paths are relative to `config.toml`.
- Auto-memory lives in `~/memory` (symlink to `memory/` in the repo; `autoMemoryDirectory`),
  one store for every project. Commit memory changes like any other config.
- Add setup to the config, never as a one-off command. Run `mise bootstrap` (or
  `--dry-run`), check `mise dot status`, then commit and push.
- Assume a bare Arch/container with only mise installed. Omarchy is an optional extra,
  so guard anything that needs it. Get dependencies from mise, not the OS
  (git, ssh and curl excepted).

## Gotchas learned the hard way

- `mise dot add -s <relative>` wrote a broken relative symlink. Use
  `--no-apply`, then `mise dot apply`.
- Use `mode = "copy"` for files that other programs rewrite (`~/.claude/settings.json`)
  or that sshd checks (`~/.ssh/authorized_keys`).
- My Bash tool runs from a shell snapshot taken at session start, so `.bashrc`
  and PATH changes reach me only after a restart.
- Everything I start inherits my env (`CLAUDECODE=1`, `CLAUDE_CODE_CHILD_SESSION=1`, …).
  The desktop app runs me via SSH as a child too, so these vars can't tell
  main agent from subagent. Use systemd units for a clean environment.
- Security is structural: unix users, groups, modes and sockets. Never an env var
  or a promise.

## Secrets

- fnox + age. My machine key is `~/.ssh/local-per-machine-age.txt` (created by the
  bootstrap task, never committed); `FNOX_AGE_KEY_FILE` points at it.
- In `/skogai`, mise sets `FNOX_PROFILE=claude` for me. Shared secrets go in the
  top-level `[secrets]` (`fnox -P default set …`); per-user ones go in
  `[profiles.<user>.secrets]` with that user's provider.
- `gh` is currently logged in as Emil's account (temporary). Planned: a GitHub App per agent.

## Inbox

`~/.config/mise/inbox/` is where Emil drops files for me. He pushes straight to `master`
(no PR) or uploads on GitHub, so `git pull` first. Triage each file: move it to its
real place (`scripts/`, `dotfiles/`, …) or delete it, then commit.

## Shared spaces

- `/skogai` (skogix:skogai, setgid) is shared by skogix, aldervall, dot, amy, goose
  and claude. Changes to it go through PRs on `skogai2/dash-skogai`, voted on before merge.
- herdr: the server and panes run under my user (`herdr session list`). Only
  drive panes from inside herdr (`HERDR_ENV=1`). Use a named session for
  experiments, and never stop `default` without asking.

## Claude Code docs

Local copy in `~/.local/share/claude-code-docs/`: read `OVERVIEW.md` (every page's
headings) first, then the page `.md` files; `llms-full.txt` is all of it in one file.
Refresh with `mise run claude-docs`. Check here before guessing at settings, hooks or flags.
