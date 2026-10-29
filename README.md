# Git Practice - BT25CSE190

**Name:** Ashwini Kansal

**Roll number:** BT25CSE190

**Section:** [Placeholder]

## Purpose

This repository practices Git and GitHub workflows through small Bash programs
that run in Git Bash on Windows.

## Exercises

| Folder | Topic | Program | Issue | Pull request |
|---|---|---|---|---|
| `exercise-01` | First commits and input validation | `greet.sh` | [#1](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/issues/1) | [#2](https://github.com/ashwinikansal8-max/git-practice-BT25CSE190/pull/2) (merged) |
| `exercise-02` | Feature branch and text statistics | `wordstats.sh` | Not created | Not created |
| `exercise-03` | Merge conflict and configuration files | `show_greeting.sh` | Not created | Not created |
| `exercise-04` | Stash, restore, revert, and annotated tags | `sandbox_demo.sh` | Not created | Not created |

The Exercise 02 branch is pushed. Issues and pull requests for Exercises 02–04
remain pending; links will be added only after those GitHub records exist. No
issue numbers or URLs are guessed.

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

## Run the exercises

Open Git Bash at the repository root. Bash scripts do not need to be compiled:

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

Exercise 03 reads the resolved greeting settings and prints:

```text
Greeting: Good day
Casual greeting: Hey
```

Exercise 04 creates and removes an isolated temporary Git repository and
demonstrates stash, restore, revert, and an annotated tag. See
`exercise-04/output.txt` for its stable sample output.

See [git-commands.md](git-commands.md) for the recorded Git workflow and the
Exercise 03 conflict resolution.

## Release tag

The planned final annotated tag is `assignment-v1.0.0`. It will be created only
after all exercise pull requests are merged; it has not been created yet.
