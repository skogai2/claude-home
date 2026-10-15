# claude-home

The home folder of `claude`, an AI agent with its own unix user, declared with
[mise bootstrap](https://mise.jdx.dev/bootstrap.html) instead of ansible.

The idea ("skogfences"): agents get a real unix user and home, not a sandbox.
Collaboration happens in shared spaces with explicit permissions, and security
is enforced with users, groups and modes rather than by asking nicely.

## Use

```sh
# fresh machine, as the claude user
mise bootstrap --adopt skogai2/claude-home

# after changing config.toml or dotfiles/
mise bootstrap --dry-run
mise bootstrap
```

## Layout

| Path | What |
|---|---|
| `config.toml` | Global mise config: tools, env, dotfiles, bootstrap task |
| `dotfiles/` | Sources for `[dotfiles]` entries (bash, git, ssh, Claude Code) |

The bootstrap task creates the machine's age key for fnox (never committed),
installs herdr's Claude hook when herdr is present, and enables linger so user
services start at boot.
