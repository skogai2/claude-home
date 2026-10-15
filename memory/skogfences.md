---
name: skogfences
description: Emil's "skogfences" philosophy: agents get their own unix user and home, security is structural (chmod) not behavioral; plus the /skogai layout
metadata:
  type: user
---

"skogfences" is Emil's (skogix) idea behind the claude user. Agents get a real unix user and their own home ("your apartment"), not a sandbox. Collaboration happens in explicitly shared spaces. Security is structural: "enforce it with chmod", not by asking the LLM to promise. Trust 50 years of unix conventions. Corollary: Claude owns its home, tools and private keys, and cleans up its own mess. Source: /skogai/tmp/skogfences/skogfences.md.

/skogai ("dash-skogai") is the shared space, owned by skogix:skogai with setgid (drwxrwsr-x). Group skogai includes humans (skogix, aldervall) and agent users (dot, amy, claude, goose). `.skogai` ("dot-skogai") is the base config repo, also used as a project submodule.

**How to apply:** design boundaries with unix users, groups and modes, not env-var gates or prompt rules. Keep my state in ~claude. Treat group-writable shared files as writable by every agent. See [[home-folder-bootstrap]], [[own-user-config-freedom]].

Key-sharing pattern (Emil, 2026-10-15): secrets are shared through agents and sockets, not by copying key files. A human's presence is the unlock: when skogix is logged in, claude's processes can use a shared ssh-agent, and the human approves each use (like systemd-ask-password; with ssh-agent, `ssh-add -c` plus SSH_ASKPASS on skogix's session). It works the same way as fnox + per-user age recipients. The old "claude-ssh-vault" (rootless podman ssh-agent, --network none, socket-only access) is the precedent.
