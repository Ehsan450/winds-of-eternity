# Migration to the Personal PC

Git is the source of truth for moving Winds of Eternity off the temporary
office PC. This is a procedure for future use; migration has **not** been tested
or accepted. Godot is NOT installed on the office PC and must not be installed
or run there for this work.

## Migration philosophy

OFFICE PC
→ Git commit
→ remote repository
→ PERSONAL PC fresh clone
→ install correct Godot version
→ open/import project
→ perform actual runtime validation
→ verify source/assets/history are intact
→ only then clean the office PC

No Git hosting provider or remote has been chosen/configured for this
procedure. The development target is Godot 4.5.x with GDScript and the
Compatibility renderer on Windows PC. Choose and record the exact 4.5.x patch
version before the first personal-PC import/runtime validation so the environment
can be reproduced. The `4.5` feature tag in `project.godot` identifies the engine
series; it does not pin an exact patch release.
Use repository-relative paths and keep credentials/tokens out of tracked files
and remote URLs recorded in documentation.

## A. Before leaving the office PC

- [ ] Run `git status` and review tracked changes and untracked files.
- [ ] Ensure all intended source, documentation, required assets, licenses, and
  project configuration are included; do not include secrets, caches, or builds.
- [ ] Commit intended work in meaningful commits and confirm `git status` is clean.
- [ ] Configure the chosen remote when separately authorized and push the intended
  branch and commits to it.
- [ ] Verify the remote contains the expected commits, comparing commit hashes
  with local history (`git log --oneline` and `git rev-parse HEAD`). Confirm the
  remote branch points to the intended final commit.
- [ ] Keep the local copy until migration acceptance. **Do NOT delete it yet.**

A clean working tree alone does not establish that work has been pushed or that
all required assets are tracked. Check both before migration.

## B. Personal PC setup

- [ ] Install Git.
- [ ] Clone the repository fresh from the chosen remote into a suitable local
  folder. Use Git history rather than copying hidden office-PC state.
- [ ] Install the chosen Godot 4.5.x patch version on the personal PC.
- [ ] Inspect the files and history using `git status`, `git log --oneline`, and
  `git ls-files`; compare the expected commit hash and required files/assets.
- [ ] Once `project.godot` exists, open/import it in the chosen Godot version and
  allow Godot to generate its local cache.
- [ ] Perform actual runtime validation: run the project and exercise the
  implemented milestone's features. Check for missing resources and script
  errors, and record actual results instead of treating file inspection as a
  gameplay test.

At the documentation-only bootstrap stage, `project.godot` does not exist.
Opening/importing and runtime checks are pending until Milestone 1 makes them
applicable. Do not mark those checks passed or claim game migration validation
from a documentation-only clone. Preserve the office copy until the project
validation gate can be met.

## C. Migration acceptance criteria

Migration is successful only when all applicable criteria below are verified.
The Godot/runtime checks remain pending until a project exists; office cleanup
also waits for successful project validation, following PRD section 21.

- [ ] A fresh clone succeeds on the personal PC.
- [ ] The expected Git history exists, including the intended final office-PC commit.
- [ ] All required tracked files/assets exist, including applicable licenses and attribution.
- [ ] The Godot project opens once applicable.
- [ ] The game runs once applicable, with actual runtime validation recorded.
- [ ] No required source depends on office-PC-only paths or files.

Verify source/assets/history are intact after the runtime checks as well. If
anything is missing or fails, resolve it and repeat the affected checks before
accepting migration or cleaning the office PC.

## D. Office PC cleanup

**Only after migration acceptance and successful project validation:**

- [ ] Confirm everything intended is pushed, including any later migration fixes.
- [ ] Confirm the verified personal-PC clone contains the latest intended work.
- [ ] Remove the local project working copy from the office PC.
- [ ] Remove project-specific credentials/tokens if any were introduced; revoke
  them where appropriate.
- [ ] Remove unnecessary cached repository credentials where appropriate.
- [ ] Preserve unrelated Git configuration and credentials belonging to other work.
- [ ] Verify no project secrets or private game files remain on the office PC,
  including any project-specific temporary copies.

These are future manual cleanup steps, not authorization to delete files now.
Do not remove the office copy or credentials before successful migration
verification.
