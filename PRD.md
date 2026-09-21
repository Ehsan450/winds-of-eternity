# Winds of Eternity --- Product Requirements Document

**Document status:** Initial development PRD\
**Engine target:** Godot 4.5.x\
**Renderer target:** Compatibility\
**Language:** GDScript\
**Genre:** 2D top-down pixel action RPG\
**Primary platform:** Windows PC\
**Development model:** Incremental, milestone-based development with
Codex assistance

------------------------------------------------------------------------

## 1. Product Vision

**Winds of Eternity** is a compact, story-driven 2D pixel action RPG.

The player controls a hero whose natural elemental power is **Wind**.
The hero travels through a fantasy world containing six elemental
dungeons. Each dungeon has its own visual identity, enemies, hazards,
mechanics, and boss.

The six bosses must be defeated in this fixed progression:

1.  Grass
2.  Water
3.  Earth
4.  Electric
5.  Shadow
6.  Fire

The Fire dungeon is the final dungeon. After defeating the Fire Boss,
the hero reaches and rescues the Princess, completing the main story.

The project should feel like a focused indie RPG rather than a large
open-world game. Scope control, reusable systems, and a playable
vertical slice are higher priorities than adding large numbers of
features.

------------------------------------------------------------------------

## 2. Core Design Pillars

The game should prioritize:

-   Responsive top-down movement.
-   Simple but satisfying action combat.
-   Wind-based hero abilities.
-   Six memorable elemental bosses.
-   Distinct elemental dungeon identities.
-   Exploration without excessive world size.
-   Clear progression.
-   Story moments and a satisfying Princess-rescue ending.
-   Cohesive pixel-art presentation.
-   Systems that are reusable instead of six copies of similar code.

------------------------------------------------------------------------

## 3. Core Gameplay Loop

The intended gameplay loop is:

> Explore → Fight enemies → Discover dungeon → Overcome dungeon hazards
> → Fight elemental boss → Unlock progression → Continue toward the next
> dungeon.

The game should remain understandable to players without requiring
complicated RPG statistics or inventory management.

------------------------------------------------------------------------

## 4. Player Character

The protagonist is a Wind-element hero.

### 4.1 Movement

The player must support:

-   Move up.
-   Move down.
-   Move left.
-   Move right.
-   Diagonal movement.
-   Environment collision.
-   Direction-aware animation.

Initial keyboard controls:

  Action         Default Input
  -------------- -------------------
  Move           WASD / Arrow Keys
  Basic Attack   Space
  Wind Ability   Q
  Dash           Shift
  Interact       E
  Pause          Esc

Input actions should use Godot's Input Map rather than hard-coded keys
wherever practical.

### 4.2 Animation

Minimum desired player animations:

-   Idle down/up/left/right.
-   Walk down/up/left/right.
-   Attack.
-   Hurt.
-   Death.

Additional animations can be introduced only when required by a
milestone.

------------------------------------------------------------------------

## 5. Wind Power System

Wind remains the hero's permanent element throughout the game.

Do not implement every ability at the beginning.

### 5.1 Wind Slash

The first combat ability.

Requirements:

-   Directional.
-   Short range.
-   Damages enemies.
-   Applies small knockback.
-   Has a short cooldown.
-   Has readable wind visual feedback.

### 5.2 Wind Dash

An early progression ability.

Possible behavior:

-   Short burst of movement.
-   Useful for dodging.
-   Useful for traversal.
-   May provide a brief invulnerability window if balancing requires it.

### 5.3 Cyclone

A later-game ability.

Possible behavior:

-   Temporary wind vortex.
-   Damages multiple enemies.
-   Stronger crowd control.
-   Longer cooldown than Wind Slash.

The ability architecture should permit additional Wind abilities without
rewriting the entire player controller.

------------------------------------------------------------------------

## 6. Health and Damage

The player must have:

-   Maximum HP.
-   Current HP.
-   Damage reception.
-   Temporary invulnerability after being hit.
-   Hurt feedback.
-   Death state.
-   Respawn behavior.

Initial balancing may begin with:

-   Player Max HP: 100.

Exact damage values are tuning data and may change during playtesting.

When HP reaches zero:

1.  Play death feedback/animation.
2.  Fade or transition the screen.
3.  Respawn the player at the latest checkpoint.

Permanent item loss is not required.

------------------------------------------------------------------------

## 7. World Structure

The game begins in a central starting area or town.

The world may use separate Godot scenes rather than one seamless map.

Suggested structure:

``` text
Starting Town
    |
    +-- Forest Region
    |      +-- Grass Dungeon
    |
    +-- Lake Region
    |      +-- Water Dungeon
    |
    +-- Mountain Region
    |      +-- Earth Dungeon
    |
    +-- Storm Region
    |      +-- Electric Dungeon
    |
    +-- Dark Region
    |      +-- Shadow Dungeon
    |
    +-- Volcanic Region
           +-- Fire Dungeon
                  +-- Princess
```

Scene transitions should be explicit and reliable.

Later dungeons must remain inaccessible until required progression
conditions are met.

------------------------------------------------------------------------

## 8. Dungeon and Boss Progression

### 8.1 Grass Dungeon

**Theme:** Ancient forest / overgrown shrine.

Purpose:

-   Introduce dungeon exploration.
-   Teach basic combat.
-   Introduce the boss encounter structure.

Potential enemies:

-   Plant creatures.
-   Vines.
-   Slimes.
-   Forest spirits.

**Boss: Grass Guardian**

Potential attacks:

-   Vine strikes.
-   Leaf projectiles.
-   Regeneration/healing.
-   Clearly telegraphed attacks.

This is the introductory and least mechanically demanding boss.

### 8.2 Water Dungeon

**Theme:** Flooded cavern / ancient water temple.

Potential mechanics:

-   Water hazards.
-   Currents.
-   Moving traversal sections.
-   Wet/slippery areas if practical.

**Boss: Water Guardian**

Potential attacks:

-   Water projectiles.
-   Waves.
-   Temporary clones.
-   Arena repositioning.

### 8.3 Earth Dungeon

**Theme:** Mountain, mine, or underground temple.

Potential mechanics:

-   Blocking rocks.
-   Pressure switches.
-   Falling debris.

**Boss: Earth Guardian**

Potential attacks:

-   Ground slam.
-   Rock projectiles.
-   Defensive armor.
-   Ground shockwaves.

The boss should feel heavy and durable.

### 8.4 Electric Dungeon

**Theme:** Storm tower / ancient energy structure.

Potential mechanics:

-   Electrical traps.
-   Timed hazards.
-   Faster enemies.

**Boss: Electric Guardian**

Potential attacks:

-   Lightning strikes.
-   Rapid movement.
-   Electric projectiles.
-   Temporarily electrified arena sections.

### 8.5 Shadow Dungeon

**Theme:** Ruined dark castle / corrupted dimension.

Potential mechanics:

-   Reduced visibility.
-   Illusions.
-   Disappearing enemies.
-   Misleading routes.

**Boss: Shadow Guardian**

Potential attacks:

-   Teleportation.
-   Clones.
-   Shadow projectiles.
-   Temporary invisibility.

### 8.6 Fire Dungeon

**Theme:** Volcanic fortress.

This is the final dungeon.

Potential mechanics:

-   Lava.
-   Fire traps.
-   Collapsing terrain.
-   Strongest regular enemies.

**Boss: Fire Guardian / Final Boss**

Potential attacks:

-   Fireballs.
-   Flame waves.
-   Charges.
-   Burning arena zones.

The final boss should eventually have at least two phases.

Defeating the Fire Boss opens the path to the Princess.

------------------------------------------------------------------------

## 9. Progression State

Boss order is fixed:

``` text
Grass
  ↓
Water
  ↓
Earth
  ↓
Electric
  ↓
Shadow
  ↓
Fire
  ↓
Princess Rescued
```

Progression should be represented by persistent game-state flags or
equivalent structured data.

Conceptual examples:

``` text
grass_boss_defeated
water_boss_defeated
earth_boss_defeated
electric_boss_defeated
shadow_boss_defeated
fire_boss_defeated
princess_rescued
```

Do not rely solely on whether a boss happens to exist in the current
scene.

------------------------------------------------------------------------

## 10. Regular Enemy Architecture

Enemies should use reusable systems.

Common enemy capabilities:

-   HP.
-   Movement speed.
-   Damage.
-   Player detection range.
-   Attack range.
-   Hurt state.
-   Knockback.
-   Death.
-   Optional drops later.

Initial MVP enemy:

### Chaser Enemy

``` text
Idle
  ↓
Player enters detection range
  ↓
Chase
  ↓
Player enters attack range
  ↓
Attack
  ↓
Player escapes
  ↓
Chase or Idle
```

The existing prototype bot behavior may be reused or refactored if
compatible.

------------------------------------------------------------------------

## 11. Boss Architecture

Do not create six completely unrelated boss systems.

Create reusable boss foundations where practical.

Conceptual structure:

``` text
Boss
├── Stats
├── State / Behavior Controller
├── Hitbox
├── Hurtbox
├── Animation
├── Attack Controller
└── Boss-Specific Abilities
```

Possible shared boss states:

``` text
IDLE
CHASE
ATTACK
HURT
PHASE_CHANGE
DEAD
```

Boss-specific scripts/resources should define elemental behavior without
duplicating the entire foundation.

Do not over-engineer the state system before the Grass Boss requires it.

------------------------------------------------------------------------

## 12. User Interface

Minimum HUD:

-   Player HP.
-   Wind energy/cooldown information when required.
-   Current ability indication when useful.

Boss encounters should display:

-   Boss name.
-   Boss HP bar.

Additional UI:

-   Dialogue box.
-   Interaction prompt.
-   Pause menu.
-   Death/respawn feedback.
-   Boss defeated notification.
-   New Game / Continue menu after save functionality exists.

Inventory and equipment systems are outside the initial MVP.

------------------------------------------------------------------------

## 13. Dialogue

The dialogue system should eventually support:

-   Speaker name.
-   Dialogue text.
-   Multiple sequential lines.
-   Advance input.
-   Optional portraits later.
-   Temporary player movement lock during important dialogue.

Do not build a complex branching conversation system unless the story
later requires one.

------------------------------------------------------------------------

## 14. Princess and Ending

The Princess is the central rescue objective of this version of the
game.

After the Fire Boss is defeated:

1.  Final boss death sequence occurs.
2.  Access to the Princess becomes available.
3.  Hero reaches the Princess.
4.  Final dialogue/cutscene plays.
5.  Princess is rescued.
6.  Ending sequence/credits begin.

The existing Angel prototype should not automatically determine the
Princess storyline. It may be removed, repurposed, or integrated later
only through an explicit design decision.

------------------------------------------------------------------------

## 15. Save System

Eventually save:

-   Boss progression.
-   Unlocked Wind abilities.
-   Current checkpoint.
-   Relevant player progression.
-   Story flags.
-   Settings.

Minimum menu support:

-   New Game.
-   Continue.

Multiple save slots are optional and not required for the MVP.

------------------------------------------------------------------------

## 16. Recommended Project Structure

``` text
res://
├── actors/
│   ├── player/
│   │   ├── Player.tscn
│   │   └── player.gd
│   ├── enemies/
│   │   ├── EnemyBase.gd
│   │   └── BasicEnemy.tscn
│   └── bosses/
│       ├── BossBase.gd
│       ├── GrassBoss.tscn
│       ├── WaterBoss.tscn
│       ├── EarthBoss.tscn
│       ├── ElectricBoss.tscn
│       ├── ShadowBoss.tscn
│       └── FireBoss.tscn
├── world/
│   ├── Town.tscn
│   ├── grass/
│   ├── water/
│   ├── earth/
│   ├── electric/
│   ├── shadow/
│   └── fire/
├── systems/
│   ├── GameManager.gd
│   ├── SaveManager.gd
│   └── SceneManager.gd
├── ui/
│   ├── HUD.tscn
│   ├── DialogueBox.tscn
│   ├── BossHealthBar.tscn
│   └── PauseMenu.tscn
└── assets/
    ├── characters/
    ├── enemies/
    ├── bosses/
    ├── tilesets/
    ├── effects/
    └── audio/
```

This is a target organization, not permission to create every file
immediately.

------------------------------------------------------------------------

## 17. Art Direction

Target style:

**Top-down fantasy pixel RPG.**

Priorities:

-   Cohesive pixel scale.
-   Readable silhouettes.
-   Nearest-neighbor texture filtering.
-   Consistent art style.
-   Clear elemental visual identities.

Element identities:

-   Grass: leaves, vines, green natural effects.
-   Water: waves, droplets, blue/teal effects.
-   Earth: rocks, dust, brown/stone effects.
-   Electric: lightning, sparks, yellow/white effects.
-   Shadow: darkness, smoke, purple/black effects.
-   Fire: flames, embers, red/orange effects.
-   Wind: gusts, arcs, particles, pale/white/light-blue effects.

Third-party assets must only be included when their license permits use
in the project. Preserve license/attribution files where required.

------------------------------------------------------------------------

## 18. Audio

Eventually support:

-   Town theme.
-   Region/dungeon music.
-   Boss music.
-   Final boss music.
-   Wind ability sounds.
-   Attack/hit/death sounds.
-   UI sounds.
-   Environmental ambience.

Audio is not allowed to block early gameplay milestones.

------------------------------------------------------------------------

## 19. First Vertical Slice

Do **not** build all six dungeons first.

The first complete playable slice is:

> Town → Grass Region/Dungeon → Regular Enemy → Grass Boss → Victory →
> Progression Unlock

The vertical slice should eventually include:

-   Player movement.
-   Player animation.
-   Camera.
-   Environment collision.
-   Wind Slash.
-   Player HP/damage.
-   One reusable regular enemy.
-   Enemy damage/death.
-   Grass dungeon.
-   Grass Boss.
-   Boss HP bar.
-   Boss victory state.
-   Basic dialogue.
-   Scene transitions.
-   Basic progression state.

Only after this slice works should development scale to the remaining
elements.

------------------------------------------------------------------------

## 20. Development Milestones

### Milestone 0 --- Repository Bootstrap

Goal:

-   Create a portable repository without requiring Godot to be installed
    on the temporary office PC.
-   Store PRD and development documentation.
-   Establish `.gitignore`, README, project structure guidance, and task
    tracking.
-   Do not pretend to run Godot or validate gameplay on this machine.

### Milestone 1 --- Godot Project Foundation

Performed once development reaches a machine with Godot 4.5.x available.

Goal:

-   Create/open the Godot project.
-   Establish player movement and animation.
-   Camera and collisions.
-   Input Map.
-   Basic test map.
-   Validate the project by actually running it in Godot.

### Milestone 2 --- Combat Foundation

Goal:

-   Wind Slash.
-   Hitbox/hurtbox behavior.
-   Damage.
-   Player HP.
-   Enemy HP.
-   Knockback.
-   Enemy death.

### Milestone 3 --- Grass Vertical Slice

Goal:

-   Grass region/dungeon.
-   Basic enemies.
-   Dungeon entrance/exit.
-   Grass Boss.
-   Boss health bar.
-   Victory state.
-   Unlock next progression state.

### Milestone 4 --- Core Game Systems

Goal:

-   HUD.
-   Dialogue.
-   Checkpoints.
-   Save/load.
-   Progression management.

### Milestone 5 --- Water and Earth

Goal:

-   Reuse proven systems.
-   Implement Water dungeon/boss.
-   Implement Earth dungeon/boss.
-   Add mechanics only when required.

### Milestone 6 --- Electric and Shadow

Goal:

-   Implement Electric dungeon/boss.
-   Implement Shadow dungeon/boss.
-   Expand combat patterns.

### Milestone 7 --- Fire and Ending

Goal:

-   Fire dungeon.
-   Multi-phase final boss.
-   Princess rescue.
-   Ending sequence.
-   Credits.

### Milestone 8 --- Polish and Release

Goal:

-   Audio.
-   VFX.
-   Balancing.
-   Bug fixing.
-   Menus/settings.
-   Windows export.
-   Final playthrough.

------------------------------------------------------------------------

## 21. Development Environment and Portability Constraints

The project initially begins on a **temporary office PC that does not
have Godot installed**.

Therefore:

1.  The office PC is a temporary development/bootstrap environment.
2.  Do not assume Godot is installed there.
3.  Do not claim scenes or GDScript have been runtime-tested unless they
    were actually opened and executed with the required Godot version.
4.  Early office-PC work should focus on repository setup,
    documentation, source files that can be safely prepared without
    runtime validation, and planning.
5.  Do not use machine-specific absolute paths.
6.  Do not commit credentials, tokens, private files, editor caches,
    generated builds, or machine-specific data.
7.  Git will become the transfer/source-of-truth mechanism.
8.  Before migration, ensure all intended source files are committed and
    pushed to the user's repository.
9.  On the personal PC, clone the repository fresh rather than copying
    hidden machine state.
10. Install the required Godot version on the personal PC and perform
    actual runtime validation there.
11. Only after the personal-PC clone and project validation succeed
    should the office-PC working copy and project-specific credentials
    be removed.
12. Removal from the office PC must not occur before successful
    migration verification.

------------------------------------------------------------------------

## 22. Git Requirements

Repository should include an appropriate `.gitignore` for Godot 4.5.x.

At minimum, do not commit:

``` text
.godot/
```

Also exclude:

-   Exported builds.
-   Temporary files.
-   OS/editor-specific junk.
-   Secrets or credentials.
-   Any future local-only/private runtime data.

Do commit:

-   `project.godot` once the Godot project exists.
-   `.tscn` scene files.
-   `.gd` scripts.
-   Required source assets whose licenses permit repository inclusion.
-   Documentation.
-   Attribution/license files.
-   Project configuration required to reproduce the game.

Use small, meaningful commits aligned with milestones.

------------------------------------------------------------------------

## 23. Codex Working Agreement

Codex is an implementation assistant, not the game designer.

Before changing code:

1.  Read this PRD.
2.  Inspect the repository.
3.  Explain what currently exists.
4.  Identify assumptions and conflicts.
5.  Propose the smallest next implementation step.
6.  Wait for approval when explicitly instructed to do so.

During implementation:

-   Work incrementally.
-   Preserve already-working behavior unless a change is necessary.
-   Prefer simple native Godot functionality.
-   Avoid unnecessary dependencies.
-   Avoid premature abstractions.
-   Never silently redesign game requirements.
-   Never fabricate successful runtime tests.
-   Do not create all six dungeons in one pass.
-   Do not generate enormous speculative systems for future features.
-   Keep code understandable to a beginner.
-   Add comments only where they clarify non-obvious behavior.

After each implementation task, report:

1.  Files created.
2.  Files modified.
3.  What changed.
4.  Why it changed.
5.  Manual Godot Editor steps required.
6.  Exact tests the user should perform.
7.  Expected results.
8.  Known limitations.
9.  Suggested next step.

Stop after the requested milestone/task.

------------------------------------------------------------------------

## 24. Office-PC Codex Constraint

While Codex is running against the repository on the office PC:

> Godot is not installed on this machine. Do not attempt to run Godot,
> claim runtime validation, or treat static inspection as gameplay
> verification. Clearly distinguish checks you can perform locally from
> checks that must wait until the project is opened on the personal PC
> with Godot installed.

If tooling later changes and Godot becomes available, this constraint
may be revised explicitly.

------------------------------------------------------------------------

## 25. Definition of Done

The project is complete when:

-   A new player can start the game.
-   The hero can move and fight using Wind powers.
-   The six dungeons are playable in the intended sequence.
-   Each dungeon has its elemental boss.
-   Progression survives save/load.
-   Defeated bosses remain defeated as intended.
-   The Fire Boss acts as the final boss.
-   The Princess rescue sequence works.
-   Ending/credits can be reached without developer intervention.
-   A fresh clone on the personal development machine can reproduce the
    project.
-   A Windows build can be exported and played successfully.
-   No project secrets or required source files remain dependent on the
    temporary office PC.

------------------------------------------------------------------------

## 26. Non-Goals for the Initial Version

Unless deliberately added later, the initial game does not require:

-   Online multiplayer.
-   Cloud saves.
-   Procedural world generation.
-   Large open world.
-   Complex crafting.
-   Large inventory/equipment system.
-   Skill trees with dozens of abilities.
-   Voice acting.
-   Multiple endings.
-   Multiple playable characters.
-   Mobile release.
-   Console release.

Keeping these outside the initial scope is intentional.

------------------------------------------------------------------------

## 27. First Codex Instruction

The first Codex session should receive the following instruction:

> Read `PRD.md` completely. This repository is for a Godot 4.5.x 2D pixel
> action RPG, but Godot is NOT installed on this temporary office PC. Do
> not modify files yet. Inspect the repository and report what currently
> exists, what is missing for Milestone 0, any conflicts with the PRD,
> and a small proposed Milestone 0 plan. Do not attempt to run Godot and
> do not claim gameplay/runtime verification. Wait for my approval
> before making changes.
