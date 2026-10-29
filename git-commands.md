# Git commands used

Run local commands from the repository root in Git Bash unless noted. Never
stage the unrelated untracked diff transcript in the worktree.

## Repository state and commits

| Command | Purpose and use |
|---|---|
| `git init -b main` | Initialize a new repository with `main` as its initial branch (initial repository creation was already completed). |
| `git status --short --branch` | Check the current branch and worktree before editing or committing. |
| `git log --oneline --graph --decorate -15` | Inspect recent history and branch relationships. |
| `git add <specific-files>` | Stage only the files for the current exercise. |
| `git diff --cached` | Review staged content before committing. |
| `git commit -m "<message>"` | Record a meaningful exercise change. |
| `git remote add origin <repository-url>` | Add the GitHub remote when setting up a new local clone (the existing `origin` was preserved). |
| `git remote -v` | Inspect the configured remote without changing it. |

The preserved history starts with `55320b2` (initial structure), followed by
`6ca037c` (Exercise 01) and merge commit `f3fe9b0` (Exercise 01 pull request).
Exercise 02 is recorded locally as `2b25b4c`.
The Exercise 03 baseline, formal variant, casual variant, and conflict
resolution are `c651a77`, `949dd9a`, `112719f`, and `87385f7`, respectively.
The Exercise 04 implementation commit is `d9c297f`.

## Branching and remotes

| Command | Purpose and use |
|---|---|
| `git switch -c feature/exercise-02-wordstats` | Create the Exercise 02 branch (already present in this repository). |
| `git switch -c feature/exercise-03-merge-conflict` | Start Exercise 03 from the Exercise 02 branch so its PR can follow Exercise 02. |
| `git switch -c exercise-03-formal` | Create the formal greeting variant from the shared Exercise 03 base. |
| `git switch feature/exercise-03-merge-conflict` | Return to the feature branch for the contrasting edit and merge. |
| `git push --dry-run origin feature/exercise-02-wordstats` | Checked the proposed Exercise 02 push without publishing it. |
| `git push -u origin feature/exercise-02-wordstats` | Published the Exercise 02 branch; its remote ref was verified at `2b25b4c6a9bc22c1e7d4d4636564aaf1619c3706`. |
| `git push -u origin feature/exercise-03-merge-conflict` | Published the Exercise 03 branch; its remote ref was verified at `272130b11d0bf8c57267a064389426974a4cad3e`. |
| `git push -u origin feature/exercise-04-git-operations` | Published the Exercise 04 branch; its remote ref was verified at `030c157c6454c60a826dbeb3b0fd431428aa0704`. |
| `git push -u origin <feature-branch>` | Publish a subsequent feature branch and configure its upstream. |
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

Run the demonstration from the repository root in Git Bash:

```bash
bash exercise-04/sandbox_demo.sh
```

It initializes a unique temporary repository, sets demo-only user configuration
there, saves and restores a change with `git stash`, makes an undo commit with
`git revert`, discards an unstaged edit with `git restore`, and creates an
annotated tag with `git tag -a`. Its cleanup removes only the generated
temporary repository, not assignment files. The expected standard output is in
`exercise-04/output.txt`.

## GitHub issues and pull requests

The Exercise 01 issue [#1](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/1)
and merged pull request [#2](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/2)
are existing records. The Exercise 02, 03, and 04 feature branches are pushed,
but their issues and pull requests are not created. `gh` is not installed, and
the available browser session is signed out. The following are pending, not
executed:

```bash
gh issue create --title "Exercise 02: Word statistics" --body "<exercise details>"
gh pr create --base main --head feature/exercise-02-wordstats --title "Complete Exercise 02" --body "Closes #<issue-number>"
gh pr checks
gh pr merge <pull-request-number> --merge
git pull --ff-only origin main
```

Repeat with the relevant exercise branch and issue for Exercises 03 and 04.
Use the real issue number in `Closes #...`; do not guess IDs or URLs. A pull
request must be reviewed and its required checks must pass before merging.

## Final assignment tag

The intended annotated release tag is `assignment-v1.0.0`, after all exercise
pull requests are merged and `main` is verified. It has not been created or
pushed because the pull requests are still pending:

```bash
git tag -a assignment-v1.0.0 -m "Complete Git practice assignment"
git push origin assignment-v1.0.0
```
