# Git commands used

Run local commands from the repository root in Git Bash unless noted. Stage
specific paths only; unrelated untracked files are not part of this assignment.

## Repository setup and history

| Command | Purpose |
|---|---|
| `git init -b main` | Initialize a repository with `main` as its initial branch. |
| `git remote add origin <repository-url>` | Add the GitHub remote when setting up a repository. |
| `git remote -v` | Inspect the configured remotes. |
| `git status --short --branch` | Check the current branch and worktree. |
| `git log --oneline --graph --decorate -15` | Inspect recent history and branch relationships. |
| `git add <specific-files>` | Stage only the intended exercise files. |
| `git diff --cached` | Review staged changes before committing. |
| `git commit -m "<message>"` | Record a meaningful change. |
| `git fetch origin` | Update remote-tracking refs without changing the current branch. |
| `git pull --ff-only origin main` | Synchronize local `main` without creating an unexpected merge commit. |
| `git push -u origin <feature-branch>` | Publish a feature branch and set its upstream. |

The original commits are `55320b2` (initial structure), `6ca037c` (Exercise
01), and `f3fe9b0` (Exercise 01 PR merge). Exercise 02 was committed as
`2b25b4c`, then its documentation update as `3abf89b`; PR #4 is merged. The
Exercise 03 implementation and actual conflict-resolution history are
`c651a77`, `112719f`, `949dd9a`, and `87385f7`.

## Exercise 03: real merge conflict

The common starting line in `exercise-03/settings.conf` was `greeting=Hello`.
On `exercise-03-formal`, it was changed to `greeting=Good day`. On
`feature/exercise-03-merge-conflict`, the same line was changed to
`greeting=Hey`. This command produced the actual content conflict:

```bash
git merge --no-edit exercise-03-formal
```

Git reported a conflict, and `git status --short` showed
`UU exercise-03/settings.conf`. The conflicted sides were `greeting=Hey` on
`HEAD` and `greeting=Good day` on `exercise-03-formal`. The resolution retained
both settings and removed Git's conflict markers:

```text
greeting=Good day
casual_greeting=Hey
```

The result was tested with `bash exercise-03/show_greeting.sh` and committed as
`87385f7`. The formal variant branch is retained as `exercise-03-formal`.

After PR #4 merged into `main`, the Exercise 03 branch was updated with:

```bash
git switch main
git pull --ff-only origin main
git switch feature/exercise-03-merge-conflict
git merge --no-edit origin/main
```

That update caused content conflicts in `README.md` and `git-commands.md`.
During the merge, the updated `main` version of the README was kept to preserve
the current section and merged Exercise 02 links; the feature-branch version of
`git-commands.md` was kept to preserve the genuine conflict record. Both
documents are being reconciled with the final links and status.

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

## GitHub issues and pull requests

Existing records:

- Exercise 01: [issue #1](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/1), [merged PR #2](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/2).
- Exercise 02: [closed issue #3](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/3), [merged PR #4](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/4). The pull request body links the issue with `Closes #3`.
- Exercise 03: [issue #5](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/5); its pull request is pending.
- Exercise 04: [issue #6](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/6); its pull request is pending.

Pull requests are created through GitHub's compare page by selecting the base
branch `main` and the feature branch as compare, then providing a title and a
body containing `Closes #<issue-number>`. Review the changed files and checks
before merging.

## Final tag

Create and publish `assignment-v1.0.0` only after all exercise pull requests
have been merged and `main` has been verified:

```bash
git tag -a assignment-v1.0.0 -m "Complete Git practice assignment"
git push origin assignment-v1.0.0
```
