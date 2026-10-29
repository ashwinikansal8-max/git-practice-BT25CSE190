# Git commands for Exercise 02

The exercise branch is `feature/exercise-02-wordstats`. Run the following
commands from the repository root in Git Bash.

| Command | Purpose |
|---|---|
| `git status --short --branch` | Confirm the current branch and see which files have changed. |
| `cd exercise-02 && bash wordstats.sh` | Run the script against the sample input. |
| `git diff -- README.md git-commands.md exercise-02` | Review the Exercise 02 changes before staging. |
| `git add README.md git-commands.md exercise-02/wordstats.sh exercise-02/input.txt exercise-02/output.txt` | Stage only the exercise script, sample files, and related documentation. |
| `git diff --cached` | Review exactly what is staged for the commit. |
| `git commit -m "Add word statistics exercise"` | Commit the staged Exercise 02 changes. |
| `git push -u origin feature/exercise-02-wordstats` | Publish the branch and set its upstream after you are ready to push. |

The script prints counts to standard output; it does not overwrite
`exercise-02/output.txt`. That file records the expected output for the sample
input.
