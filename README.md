# Git Practice - BT25CSE190

**Name:** Ashwini Kansal

**Roll number:** BT25CSE190

**Section:** CSE c2

## Purpose

Practice Git and GitHub workflows using small Bash programs compatible with
Git Bash on Windows.

## Exercises

| Folder | Topic | Program | Issue | Pull request |
|---|---|---|---|---|
| `exercise-01` | Greeting and input validation | `greet.sh` | [#1](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/1) | [#2](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/2) (merged) |
| `exercise-02` | Feature branch and text statistics | `wordstats.sh` | [#3](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/3) | [#4](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/4) (merged) |
| `exercise-03` | Configured greeting and merge conflict | `show_greeting.sh` | [#5](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/5) | [#7](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/7) (merged) |
| `exercise-04` | Stash, restore, revert, and annotated tags | `sandbox_demo.sh` | [#6](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/6) | [#8](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/8) (merged) |

All exercise pull requests are merged. PR #4 closes issue #3, PR #7 closes
issue #5, and PR #8 closes issue #6.

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
the results in `exercise-04/output.txt`. The script cleans up only its own
temporary repository.

See [git-commands.md](git-commands.md) for the documented Git workflow and the
real Exercise 03 merge conflict and resolution.

## Final tag

The final annotated release tag is `assignment-v1.0.0`.
