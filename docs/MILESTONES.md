# Development Milestones

Based on [PRD.md](../PRD.md), especially sections 19 and 20. Checked items record
completed work only. Documentation review, migration, and all Godot/runtime
work remain pending. Godot is NOT installed on the temporary office PC.

## Milestone 0 — Repository Bootstrap

- [x] PRD established.
- [x] Git repository initialized.
- [x] `.gitignore` created.
- [x] README created.
- [x] Initial baseline commit created.
- [ ] Documentation completed/reviewed.
- [ ] Remote repository configured.
- [ ] Initial repository pushed.
- [ ] Migration procedure verified on personal PC.

The three documentation files have been drafted; the combined documentation
item stays pending until review is complete. See [MIGRATION.md](MIGRATION.md)
for migration acceptance requirements.

## Milestone 1 — Godot Project Foundation

Milestone 1A — static project bootstrap: **PREPARED**, not runtime validated.
`project.godot` and the requested directory placeholders are prepared on the
office PC. No scenes, scripts, gameplay input actions, or main scene are configured.
**UNVERIFIED — REQUIRES GODOT RUNTIME VALIDATION.** Project import, renderer
initialization, viewport scaling, texture filtering, and execution have not been
validated in Godot. Continue editor/runtime work on a machine with the chosen
Godot 4.5.x patch version available, using GDScript and the Compatibility renderer
on Windows PC. Milestone 1 remains incomplete.

- [ ] Create/open the Godot project.
- [ ] Establish player movement and direction-aware animation.
- [ ] Add camera and environment collisions.
- [ ] Configure the Input Map.
- [ ] Create a basic test map.
- [ ] Validate the project by actually running it in Godot.

## Milestone 2 — Combat Foundation

- [ ] Implement directional, short-range Wind Slash with cooldown and readable feedback.
- [ ] Implement hitbox/hurtbox behavior.
- [ ] Implement damage.
- [ ] Implement player HP.
- [ ] Implement enemy HP.
- [ ] Implement knockback.
- [ ] Implement enemy death.

## Milestone 3 — Grass Vertical Slice

- [ ] Build the Grass region/dungeon.
- [ ] Add basic enemies using a reusable regular enemy foundation.
- [ ] Implement dungeon entrance/exit and scene transitions.
- [ ] Implement the Grass Boss.
- [ ] Add the boss health bar.
- [ ] Implement the victory state.
- [ ] Unlock the next progression state after victory.
- [ ] Verify the playable route: Town → Grass Region/Dungeon → Regular Enemy → Grass Boss → Victory → Progression Unlock.

The first complete slice also needs basic dialogue and progression state, as
specified in PRD section 19. Introduce only what the slice requires; Milestone 4
expands the core systems. Do not scale to the remaining elements until the
slice works in Godot.

## Milestone 4 — Core Game Systems

- [ ] Implement the HUD.
- [ ] Implement dialogue.
- [ ] Implement checkpoints and death/respawn integration.
- [ ] Implement save/load with New Game / Continue support.
- [ ] Implement progression management and verify persistence across save/load.

## Milestone 5 — Water and Earth

- [ ] Reuse proven systems.
- [ ] Implement the Water dungeon/boss.
- [ ] Implement the Earth dungeon/boss.
- [ ] Add mechanics only when required.

## Milestone 6 — Electric and Shadow

- [ ] Implement the Electric dungeon/boss.
- [ ] Implement the Shadow dungeon/boss.
- [ ] Expand combat patterns.

## Milestone 7 — Fire and Ending

- [ ] Implement the Fire dungeon.
- [ ] Implement the multi-phase final boss.
- [ ] Implement the Princess rescue.
- [ ] Implement the ending sequence.
- [ ] Add credits.

## Milestone 8 — Polish and Release

- [ ] Add and polish audio.
- [ ] Polish VFX.
- [ ] Balance gameplay through playtesting.
- [ ] Fix bugs.
- [ ] Complete menus/settings.
- [ ] Export and play the Windows build.
- [ ] Complete a final playthrough through the six bosses in order and the Princess rescue/ending.

Runtime-dependent items require actual execution on a Godot-equipped machine;
static inspection alone does not complete them. The PRD remains the source of
requirements, including its definition of done and initial non-goals.
