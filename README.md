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
| `exercise-02` | Feature branch and text statistics | `wordstats.sh` | Pending | Pending |
| `exercise-03` | Merge conflict and configuration files | `show_greeting.sh` | Pending | Pending |
| `exercise-04` | Stash, restore, revert, and annotated tags | `sandbox_demo.sh` | Pending | Pending |

Issues and pull requests for Exercises 02–04 have not been created; their links
will be added after authenticated GitHub access is available. No issue numbers
or URLs are guessed.

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
```

## Run the exercises

Open Git Bash at the repository root. Bash scripts do not need to be compiled:

```bash
bash exercise-01/greet.sh exercise-01/input.txt
bash exercise-02/wordstats.sh exercise-02/input.txt
bash exercise-03/show_greeting.sh exercise-03/settings.conf
```

Exercise 01 prints `Hello, Ashwini Kansal! Welcome to Git practice.` Exercise
02's sample results are 3 lines, 17 words, and 113 characters; see
`exercise-02/output.txt`. Exercise 03 reads the resolved greeting settings and
prints:

```text
Greeting: Good day
Casual greeting: Hey
```

Exercise 04 is in progress on its feature branch and will use a temporary Git
repository so its demonstration does not modify this assignment repository.

See [git-commands.md](git-commands.md) for the recorded Git workflow and the
Exercise 03 conflict resolution.

## Release tag

The planned final annotated tag is `assignment-v1.0.0`. It will be created only
after all exercise pull requests are merged; it has not been created yet.
