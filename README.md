# Git Practice - BT25CSE190

**Name:** Ashwini Kansal

**Roll number:** BT25CSE190

**Section:** [Placeholder]

## Purpose

Practice Git and GitHub workflows using small Bash programs compatible with
Git Bash on Windows.

## Exercises

| Folder | Topic | Program | Issue | Pull request |
|---|---|---|---|---|
| `exercise-01` | Greeting and input validation | `greet.sh` | [#1](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/1) | [#2](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/2) (merged) |
| `exercise-02` | Feature branch and text statistics | `wordstats.sh` | [#3](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/3) | [#4](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/4) (open) |
| `exercise-03` | Configured greeting and merge conflict | `show_greeting.sh` | [#5](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/5) | Pending |
| `exercise-04` | Stash, restore, revert, and annotated tags | `sandbox_demo.sh` | [#6](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/6) | Pending |

PR #4 closes issue #3. Its branch is pushed and the local Git Bash test suite
passes. This repository has no configured status checks; PR #4 is open and
unmerged. Exercises 03 and 04 have issues but their pull requests remain
pending.

## Repository structure

```text
README.md
git-commands.md
.gitattributes
exercise-01/
    greet.sh
    input.txt
    output.txt
exercise-02/
    wordstats.sh
    input.txt
    output.txt
exercise-03/
    show_greeting.sh
    settings.conf
    output.txt
exercise-04/
    sandbox_demo.sh
    output.txt
```

## Run in Git Bash

From the repository root:

```bash
bash exercise-01/greet.sh exercise-01/input.txt
bash exercise-02/wordstats.sh exercise-02/input.txt
bash exercise-03/show_greeting.sh exercise-03/settings.conf
bash exercise-04/sandbox_demo.sh
```

Exercise 01 prints `Hello, Ashwini Kansal! Welcome to Git practice.` Exercise
02's sample output is:

```text
File:       input.txt
Lines:      3
Words:      17
Characters: 113
```

See `exercise-02/output.txt` for Exercise 02. Exercise 03 prints:

```text
Greeting: Good day
Casual greeting: Hey
```

Exercise 04 runs the Git operations in its own temporary repository and prints
the results in `exercise-04/output.txt`.

See [git-commands.md](git-commands.md) for the documented Git workflow and the
real Exercise 03 merge conflict and resolution.

## Final tag

The planned annotated tag is `assignment-v1.0.0`. It has not been created:
Exercises 02–04 have not all been merged into `main`.
