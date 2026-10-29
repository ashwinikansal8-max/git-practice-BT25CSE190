# Git commands used

Run local commands from the repository root in Git Bash unless noted. Never
stage the unrelated untracked diff transcript in the worktree.

## Repository state and commits

| Command | Purpose and use |
|---|---|
| `git status --short --branch` | Check the current branch and worktree before editing or committing. |
| `git log --oneline --graph --decorate -15` | Inspect recent history and branch relationships. |
| `git add <specific-files>` | Stage only the files for the current exercise. |
| `git diff --cached` | Review staged content before committing. |
| `git commit -m "<message>"` | Record a meaningful exercise change. |

The preserved history starts with `55320b2` (initial structure), followed by
`6ca037c` (Exercise 01) and merge commit `f3fe9b0` (Exercise 01 pull request).
Exercise 02 is recorded locally as `2b25b4c`.
The Exercise 03 baseline, formal variant, casual variant, and conflict
resolution are `c651a77`, `949dd9a`, `112719f`, and `87385f7`, respectively.

## Branching and remotes

| Command | Purpose and use |
|---|---|
| `git switch -c feature/exercise-02-wordstats` | Create the Exercise 02 branch (already present in this repository). |
| `git switch -c feature/exercise-03-merge-conflict` | Start Exercise 03 from the Exercise 02 branch so its PR can follow Exercise 02. |
| `git switch -c exercise-03-formal` | Create the formal greeting variant from the shared Exercise 03 base. |
| `git switch feature/exercise-03-merge-conflict` | Return to the feature branch for the contrasting edit and merge. |
| `git remote -v` | Inspect the configured remote without changing it. |
| `git push --dry-run origin feature/exercise-02-wordstats` | Checked the proposed push; it reported a new remote branch but did not publish it. |
| `git push -u origin <feature-branch>` | Publish a branch and configure its upstream (not run; GitHub workflow is blocked by missing authenticated write access). |
| `git pull --ff-only origin main` | Update a local branch without creating an unexpected merge commit. |

## Exercise 03: genuine merge conflict

The common starting line in `exercise-03/settings.conf` was
`greeting=Hello`. On `exercise-03-formal`, it was changed to `greeting=Good
day`. On `feature/exercise-03-merge-conflict`, the same line was changed to
`greeting=Hey`. The merge was actually run:

```bash
git merge --no-edit exercise-03-formal
```

Git reported a content conflict and `git status --short` showed:

```text
UU exercise-03/settings.conf
```

The conflicted content was:

- `<<<<<<< HEAD`
- `greeting=Hey`
- `=======`
- `greeting=Good day`
- `>>>>>>> exercise-03-formal`

The resolution retains both styles, removes all conflict markers, and makes the
formal greeting the primary one:

```text
greeting=Good day
casual_greeting=Hey
```

After verifying `bash exercise-03/show_greeting.sh` against the sample, both
`exercise-03/settings.conf` and `exercise-03/output.txt` were staged and the
merge was committed as `87385f7`. The formal branch is retained locally as
`exercise-03-formal`.

## Exercise 04: isolated Git operations

The Exercise 04 implementation and its Git Bash test results are being added on
`feature/exercise-04-git-operations`; the script instructions will be finalized
there.

## GitHub issues and pull requests

The Exercise 01 issue [#1](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/1)
and merged pull request [#2](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/2)
are existing records. No GitHub write operation was performed for Exercises
02–04: `gh` is not installed, and the available browser session is signed out.
Do not treat the following as executed commands; they are the pending workflow
once authenticated GitHub write access is available:

```bash
gh issue create --title "Exercise 02: Word statistics" --body "<exercise details>"
gh pr create --base main --head feature/exercise-02-wordstats --title "Complete Exercise 02" --body "Closes #<issue-number>"
gh pr checks
gh pr merge <pull-request-number> --merge
git pull --ff-only origin main
```

Repeat with the relevant exercise branch and issue for Exercises 03 and 04.
Use the real issue number in `Closes #...`; do not guess IDs or URLs.

## Final assignment tag

The intended annotated release tag is `assignment-v1.0.0`, after all exercise
pull requests are merged and `main` is verified. It has not been created or
pushed because the pull requests are still pending:

```bash
git tag -a assignment-v1.0.0 -m "Complete Git practice assignment"
git push origin assignment-v1.0.0
```
