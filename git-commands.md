# Git commands used

Run local commands from the repository root in Git Bash unless noted. Stage
specific assignment paths only; unrelated untracked files are not part of this
work.

## Repository setup and history

| Command | Purpose |
|---|---|
| `git init -b main` | Initialize a repository with `main` as its initial branch. |
| `git remote add origin <repository-url>` | Add the GitHub remote when setting up a repository. |
| `git remote -v` | Inspect configured remotes. |
| `git status --short --branch` | Check the current branch and worktree. |
| `git log --oneline --graph --decorate -15` | Inspect recent history and branch relationships. |
| `git add <specific-files>` | Stage only the intended exercise files. |
| `git diff --cached` | Review staged changes before committing. |
| `git commit -m "<message>"` | Record a meaningful change. |
| `git fetch origin` | Update remote-tracking refs without changing the current branch. |
| `git pull --ff-only origin main` | Synchronize local `main` without an unexpected merge commit. |
| `git push -u origin <feature-branch>` | Publish a branch and set its upstream. |

The preserved history starts with `55320b2` (initial structure), `6ca037c`
(Exercise 01), and `f3fe9b0` (Exercise 01 PR merge). Exercise 02 was committed
as `2b25b4c`, with documentation commit `3abf89b`; PR #4 is merged. Exercise
03 includes implementation commit `c651a77`, variant commits `112719f` and
`949dd9a`, merge resolution `87385f7`, and synchronization merge `befd01d`.
PR #7 merged the Exercise 03 work into main at `33cabdc`.
Exercise 04 was implemented in `d9c297f`; its branch synchronization merge is
`6ac2f8c`. PR #8 merged the finished assignment exercises into main at
`ef615391c1025fec3dca57ba352aca76b904d544`.

## Branching and publishing

| Command | Purpose |
|---|---|
| `git switch -c feature/exercise-02-wordstats` | Create the Exercise 02 branch (it already existed). |
| `git switch -c feature/exercise-03-merge-conflict` | Create the Exercise 03 branch from the Exercise 02 work. |
| `git switch -c exercise-03-formal` | Create the formal-greeting conflict variant. |
| `git switch feature/exercise-03-merge-conflict` | Return to the feature branch for the contrasting edit and merge. |
| `git switch -c feature/exercise-04-git-operations` | Create the Exercise 04 branch. |
| `git merge --no-edit <branch>` | Merge a branch, creating a merge commit when required. |

## Exercise 03: genuine merge conflict

The shared `exercise-03/settings.conf` line began as `greeting=Hello`. On
`exercise-03-formal`, it was changed to `greeting=Good day`; on
`feature/exercise-03-merge-conflict`, the same line was changed to
`greeting=Hey`. Running:

```bash
git merge --no-edit exercise-03-formal
```

produced the real content conflict in `exercise-03/settings.conf`. Git reported
`UU exercise-03/settings.conf`. The conflict was resolved by retaining both
greetings and removing Git's conflict markers:

```text
greeting=Good day
casual_greeting=Hey
```

The resolved script output was tested and recorded in
`exercise-03/output.txt`. The resolution commit is `87385f7`; the formal
variant branch is retained as `exercise-03-formal`.

After PR #4 merged into main, updating the Exercise 03 branch with
`git merge --no-edit origin/main` caused additional documentation conflicts in
`README.md` and `git-commands.md`. Both sides were inspected. The updated main
README supplied the confirmed section value and merged Exercise 02 links; the
feature documentation preserved the detailed Exercise 03 conflict record.
Those contents were combined and the merge was recorded as `befd01d`.

## Exercise 04: isolated Git operations

Run the demo from the repository root:

```bash
bash exercise-04/sandbox_demo.sh
```

The script uses a uniquely named temporary Git repository, sets demo-only Git
configuration there, saves/restores an edit with `git stash`, adds an undo
commit with `git revert`, discards an unstaged edit with `git restore`, and
creates an annotated demo tag with `git tag -a`. It removes only its own
temporary directory on exit and does not change this assignment repository.
`exercise-04/output.txt` records the expected output.

## GitHub issues and pull requests

- Exercise 01: [issue #1](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/1), [merged PR #2](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/2).
- Exercise 02: [issue #3](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/3), [merged PR #4](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/4). PR #4 includes `Closes #3`.
- Exercise 03: [issue #5](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/5), [merged PR #7](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/7). PR #7 includes `Closes #5`.
- Exercise 04: [issue #6](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/6), [merged PR #8](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/8). PR #8 includes `Closes #6`.

Create a pull request by comparing its feature branch against `main`; include
`Closes #<issue-number>` in the PR body to link its issue. Review changed files,
mergeability, and checks before merging. PR #8 was reviewed: it was mergeable
with no conflicts, and the repository had no configured checks or required
reviews. The Exercise 04 script matched its expected output on two runs before
the PR was merged.

## Final assignment tag

After all exercise PRs were merged and final `main` was verified, create and
publish the annotated `assignment-v1.0.0` tag:

```bash
git tag -a assignment-v1.0.0 -m "Complete Git practice assignment"
git push origin assignment-v1.0.0
```
