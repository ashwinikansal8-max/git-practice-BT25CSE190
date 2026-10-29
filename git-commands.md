# Git commands used

Run local commands from the repository root in Git Bash. Stage specific files
only; leave unrelated untracked files untouched.

## Setup, status, commits, and remotes

| Command | Purpose |
|---|---|
| `git init -b main` | Initialize a repository with `main` as the initial branch (already completed here). |
| `git remote add origin <repository-url>` | Add the GitHub remote when setting up a repository (the existing `origin` was preserved). |
| `git remote -v` | Inspect configured remotes. |
| `git status --short --branch` | Check the branch and worktree. |
| `git log --oneline --graph --decorate -15` | Inspect recent history and branch relationships. |
| `git add <specific-files>` | Stage only the intended exercise files. |
| `git diff --cached` | Review staged changes. |
| `git commit -m "<message>"` | Record a meaningful change. |
| `git pull --ff-only origin main` | Update local `main` without creating a merge commit. |

The original history remains: `55320b2` (initial structure), `6ca037c`
(Exercise 01), and `f3fe9b0` (Exercise 01 PR merge). Exercise 02 was committed
as `2b25b4c`. Exercise 03's baseline, variants, and merge resolution are
`c651a77`, `949dd9a`, `112719f`, and `87385f7`. Exercise 04's implementation
is `d9c297f`.

## Branching and publishing

| Command | Purpose |
|---|---|
| `git switch -c feature/exercise-02-wordstats` | Create the Exercise 02 branch (already existed). |
| `git switch -c feature/exercise-03-merge-conflict` | Create the Exercise 03 branch from the Exercise 02 work. |
| `git switch -c exercise-03-formal` | Create the formal-greeting conflict variant. |
| `git switch feature/exercise-03-merge-conflict` | Return to the feature branch for the contrasting edit and merge. |
| `git switch -c feature/exercise-04-git-operations` | Create the Exercise 04 branch. |
| `git push --dry-run origin feature/exercise-02-wordstats` | Check a proposed push without publishing it. |
| `git push -u origin <feature-branch>` | Publish a branch and set its upstream. |

Published refs verified on `origin`:

- `feature/exercise-02-wordstats`: `2b25b4c6a9bc22c1e7d4d4636564aaf1619c3706`
- `feature/exercise-03-merge-conflict`: `272130b11d0bf8c57267a064389426974a4cad3e`
- `feature/exercise-04-git-operations`: `52a5a9753ec90d34eb1507e94c3e4295be22af6e`

## Exercise 03: real merge conflict

The shared `exercise-03/settings.conf` line began as `greeting=Hello`.
`exercise-03-formal` changed it to `greeting=Good day`; the Exercise 03 feature
branch changed the same line to `greeting=Hey`. This command produced the
actual conflict:

```bash
git merge --no-edit exercise-03-formal
```

Git reported a content conflict and `git status --short` showed
`UU exercise-03/settings.conf`. The conflicted sides were `greeting=Hey` on
`HEAD` and `greeting=Good day` on `exercise-03-formal`.

The resolution retained both settings and removed Git's conflict markers:

```text
greeting=Good day
casual_greeting=Hey
```

The merged result was tested with `bash exercise-03/show_greeting.sh` and
committed as `87385f7`.

## Exercise 04: isolated stash, restore, revert, and tag

Run:

```bash
bash exercise-04/sandbox_demo.sh
```

The script uses its own temporary Git repository, sets demo-only Git
configuration there, saves/restores an edit with `git stash`, undoes a commit
with `git revert`, discards an unstaged edit with `git restore`, and creates an
annotated demo tag with `git tag -a`. It removes its uniquely named temporary
directory on exit and does not change this assignment repository.

## Issues and pull requests

Issue [#1](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/1)
and merged PR [#2](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/2)
are Exercise 01. Exercise 02 issue [#3](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/3)
and PR [#4](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/4)
are open; PR #4 contains `Closes #3`. Exercise 03 issue
[#5](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/5)
and Exercise 04 issue
[#6](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/6)
are open; their pull requests are pending.

PR #4 has no configured status checks in this repository. Local Bash tests and
the sample output comparison pass. Do not merge while checks are pending or
failed. The PR and issue operations completed so far used the authenticated
GitHub web interface; `gh` is not installed.

## Final assignment tag

`assignment-v1.0.0` is planned only after all exercise PRs are merged and
`main` is verified. It has not been created:

```bash
git tag -a assignment-v1.0.0 -m "Complete Git practice assignment"
git push origin assignment-v1.0.0
```
