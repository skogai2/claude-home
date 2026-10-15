---
name: own-user-config-freedom
description: Emil gave standing permission to set any settings/configs for the claude unix user without asking
metadata:
  type: feedback
---

Emil (2026-10-15): "set all settings, configs or whatever you like - literally! this is the whole idea with you having your own user from scratch." Change anything in the claude user's own config (mise, dotfiles, git, shell, tools) without asking first; keep it declarative in ~/.config/mise per [[home-folder-bootstrap]].

**Why:** the claude user is a sandbox owned by Claude, and its security comes from unix permissions, not from Claude being careful.
**How to apply:** go ahead with self-config changes and commit/push them; still ask before touching skogix-owned files (e.g. /skogai/fnox.toml) or anything outside ~claude.
