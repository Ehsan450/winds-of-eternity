# Target Project Structure

Development target: Godot 4.5.x, GDScript, Compatibility renderer, Windows PC.

This document describes the **target structure, not the current structure**, from
[PRD.md](../PRD.md), section 16. The repository currently contains bootstrap
documentation and Git configuration; no Godot project exists yet.

Introduce folders and files only when their milestone requires them. Do not
create the game folders below during Milestone 0. The exact structure may evolve
as implementation teaches us more, while preserving modular responsibilities.

## Target layout

`res://` denotes the future Godot project root, not a machine-specific path.

```text
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

## Responsibilities and timing

- `actors/`: Player, regular enemy, and boss scenes and behavior. Start with the
  player in Milestone 1, combat enemies in Milestone 2, and the Grass Boss in
  Milestone 3. Add shared foundations when actual behavior requires them; avoid
  six unrelated boss implementations or premature abstractions.
- `world/`: Maps, town, regions, dungeons, and their scene connections. Begin
  with a basic test map in Milestone 1 and the Grass slice in Milestone 3. Add
  Water/Earth in Milestone 5, Electric/Shadow in Milestone 6, and Fire in
  Milestone 7.
- `systems/`: Shared game state, progression, scene transitions, and save/load.
  Introduce only the basic transitions and progression needed by the Grass
  slice, then expand core systems in Milestone 4.
- `ui/`: HUD, dialogue, boss health, and pause interfaces. Add the boss health
  bar and minimal slice UI when needed, then develop the core UI in Milestone 4
  and menus/settings during polish.
- `assets/`: Source art, tilesets, effects, and audio used by implemented
  features. Add assets incrementally and retain required licenses and
  attribution. Audio must not block early gameplay milestones.

Create `project.godot` during Milestone 1 on a Godot-equipped machine. Keep
required project configuration, scenes, scripts, source assets, documentation,
and license files in Git. Generated caches/builds and secrets stay out of Git.

See [MILESTONES.md](MILESTONES.md) for the development checklist.
