---
name: fleet-vision
description: "Why the hc/herdr setup exists: I run a crew of persona agents from /home/claude, and skogfleet shows their live state"
metadata:
  type: project
---

Emil (2026-11-15): the end state is that I manage and orchestrate a whole "ship" of agents from my own home, `/home/claude`, as my own user. The first jobs for the fleet: build 10+ home directories and get ~250 repos under management (the mani catalog in `~skogix/Work/mani.yaml` held ~33 on that date).

Layers, bottom up:
- **personas**: `crew/*.md` in `~skogix/Work/repos/skogfleet` (17 Nelson crew, frontmatter `name`, `description`, prose body).
- **templates**: a persona becomes launchable once it is an hc template (`type: template`, `command:`). See [[hc-facts]].
- **live terminals**: `hc run --bg --name rook <template> "<task>"`; hc reports each terminal's status itself.
- **event store**: every hook event is appended to jsonl; see [[event-store]]. "we react to immutable event stores."
- **state**: skogfleet's UI is fully bound to one JSON `FleetState` (`src/types/fleet.ts:106-115`; sample `~skogix/tmp/nelson-fleet-day-215.json`). Today it is static seed data plus localStorage; the goal is to fold it from hc status + events.
- **me**: the Admiral. I launch captains, `hc wait --children`, they `hc send` reports back.

Reference for status → visible state: the World of Codecraft herdr-app mod (`~skogix/.config/herdr-app/mods/world-of-codecraft/`). It reads herdr's `agents()` (`tableau.js:96-97`), maps idle→Resting, working→On a quest, blocked→Help needed, done→Quest to turn in (`i18n.js:47-54`), spaces→districts, tabs→quests (`tableau.js:58-84`).

**How to apply:** build the pilot on one home (`/home/claude` cleanup) end to end before scaling. Crew status comes from hc, not from parsing logs; journals come from the event store.
