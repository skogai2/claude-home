#!/usr/bin/env bash
# SessionStart: tell the session where it is, who it runs as, and what's off.
# stdout becomes session context. Never print secrets.
cd "${CLAUDE_PROJECT_DIR:-$PWD}" || exit 0

me=$(whoami); host=$(hostname)
echo "# where am i"
echo "user: $me (uid $(id -u)) on $host, home $HOME"
echo "cwd: $PWD"
echo "ips: $(ip -brief -4 addr 2>/dev/null | awk '$1!="lo"{printf "%s=%s ", $1, $3}')"

if git rev-parse --git-dir >/dev/null 2>&1; then
  echo "git: $(git branch --show-current) | $(git status --porcelain | wc -l) dirty | last: $(git log -1 --format='%h %s (%ar)')"
  echo "author: $(git config user.name) <$(git config user.email)>"
fi

[ -d needs ] && echo "needs defined: $(ls needs | sed 's/\.md$//' | tr '\n' ' ')"

echo "session: $(env | grep -E '^(CLAUDE_CODE_SESSION_ID|CLAUDE_EFFORT|CLAUDE_CODE_ENTRYPOINT|AI_AGENT)=' | tr '\n' ' ')"

# identity drift (needs/identity.md)
[ "$me" != "claude" ] && echo "WARN identity: running as '$me', not claude"
case "$(git config user.email 2>/dev/null)" in *skogsund*) echo "WARN identity: git author is skogix's";; esac
exit 0
