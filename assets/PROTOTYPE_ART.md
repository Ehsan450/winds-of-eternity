# Temporary combat prototype art

Created specifically for Winds of Eternity using the built-in image generation
tool. No third-party game assets or character references were supplied. These
are temporary original generated designs, not final production art.

The generated RGBA PNGs were inspected, cropped to their alpha bounds, reduced
with nearest-neighbor sampling using an already-installed Pillow runtime, and
centered on transparent 32x32 cells. Alpha was preserved. No image tooling is
required to run the game; only the final PNGs below are project assets.

- `characters/player_prototype.png`: 64x64 RGBA PNG, four 32x32 frames in a 2x2
  sheet: down, right, up, left. Each figure fits within 24x28 pixels.
- `enemies/imp_prototype.png`: 32x32 RGBA PNG; figure fits within 28x26 pixels.
- `effects/wind_slash_prototype.png`: 32x32 RGBA PNG; gust fits within 28x28 pixels,
  oriented right in the source and rotated by the attack's facing direction.

Godot texture filtering is Nearest in project settings and explicitly on the
sprite nodes. Appearance in Godot is
**UNVERIFIED — REQUIRES GODOT RUNTIME VALIDATION.**

## Exact generation prompts

### Player

Create an ORIGINAL temporary pixel-art sprite sheet for a tiny top-down fantasy action RPG, not based on any existing character. One identical small adventurer in FOUR standing facing views, arranged precisely in a 2 by 2 equal-cell sprite sheet: top-left DOWN/front, top-right RIGHT/profile, bottom-left UP/back, bottom-right LEFT/profile. Teal short cloak/scarf, cream tunic, brown boots, simple brown hair, tiny leather bracers; readable tiny warrior silhouette, no held weapon. Each cell is a logical 32x32 pixels; whole sheet logical 64x64 pixels, rendered as a clean nearest-neighbor enlargement if needed. Character occupies roughly 20x26 logical pixels centered in each 32x32 cell with equal foot baseline. Strict very low resolution pixel art: few flat colors, hard square pixel edges, no gradients, no antialiasing. Actual transparent alpha background, no ground shadows, no checkerboard drawn into artwork, no labels, no borders or grids, no text. Same scale and alignment in all four cells. PNG game asset only.

### Enemy

Create an ORIGINAL temporary top-down pixel-art game sprite of one tiny hostile fantasy creature, not based on an existing character. Small plum-purple horned bog imp, red-orange eyes, squat body, short claws and two pale little horns, menacing but charming, facing DOWN/front. Extremely simple readable low-resolution silhouette and limited palette, hard square pixels, no gradients, no antialiasing. Logical canvas 32x32 pixels, creature about 24x24 pixels centered with a 4-pixel transparent border. If output is enlarged use only nearest-neighbor large square pixel blocks. Actual transparent alpha background, no drawn checkerboard, no ground shadow, no scenery, no text, no border. One sprite only. PNG game asset.

### Wind slash

Create an ORIGINAL temporary low-resolution pixel-art Wind slash sprite for a top-down fantasy action RPG. One luminous pale cyan and white curved crescent/gust sweeping toward the RIGHT, shaped like a right parenthesis ) with its bulging outer edge facing right and tapering tips toward left. Sparse tiny wind streaks, clearly readable hard square pixels, three or four flat colors only. Logical canvas 32x32 pixels with a 3-pixel transparent margin, no antialiasing or gradients or blur or glow outside the solid pixels. If enlarged use nearest-neighbor square blocks. Actual transparent alpha background, no drawn checkerboard, no text, no character, no weapon, no other objects. PNG game effect only.
