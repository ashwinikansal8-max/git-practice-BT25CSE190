#!/usr/bin/env bash
set -euo pipefail

temp_root="${TMPDIR:-/tmp}"
temp_root=$(cd "$temp_root" && pwd -P)
demo_dir=$(mktemp -d "$temp_root/git-practice-exercise-04.XXXXXX")

case "$demo_dir" in
    "$temp_root"/git-practice-exercise-04.*) ;;
    *)
        printf 'Error: unsafe temporary directory path: %s\n' "$demo_dir" >&2
        exit 1
        ;;
esac

cleanup() {
    rm -rf -- "$demo_dir"
}
trap cleanup EXIT

git -C "$demo_dir" init -q -b main
git -C "$demo_dir" config user.name "Exercise 04 Demo"
git -C "$demo_dir" config user.email "exercise-04-demo@example.invalid"
git -C "$demo_dir" config core.autocrlf false

printf 'line 1\n' > "$demo_dir/notes.txt"
git -C "$demo_dir" add notes.txt
git -C "$demo_dir" commit -q -m "Add notes"

printf '%s\n' '--- git stash: save and restore unfinished work'
printf 'line 2\n' >> "$demo_dir/notes.txt"
if ! git -C "$demo_dir" stash push -m "Exercise 04 unfinished line" >/dev/null; then
    printf '%s\n' 'Error: could not stash the unfinished changes.' >&2
    exit 1
fi
printf '%s\n' 'Stashed changes saved'
if [[ -n "$(git -C "$demo_dir" status --porcelain)" ]]; then
    printf '%s\n' 'Error: the worktree should be clean after stashing.' >&2
    exit 1
fi
printf '%s\n' 'Working tree after stash: clean'
if ! git -C "$demo_dir" stash pop >/dev/null; then
    printf '%s\n' 'Error: could not restore the stashed changes.' >&2
    exit 1
fi
printf '%s\n' 'Stashed changes restored'
printf '%s\n' 'File after stash pop:'
cat "$demo_dir/notes.txt"
git -C "$demo_dir" add notes.txt
git -C "$demo_dir" commit -q -m "Add line 2"

printf '%s\n' '--- git revert: undo a commit without rewriting history'
printf 'bad line\n' >> "$demo_dir/notes.txt"
git -C "$demo_dir" commit -q -am "Add temporary bad line"
bad_commit=$(git -C "$demo_dir" rev-parse HEAD)
git -C "$demo_dir" revert --no-edit "$bad_commit" >/dev/null
printf '%s\n' 'Reverted commit; recent history:'
git -C "$demo_dir" log -2 --format='%s'

printf '%s\n' '--- git restore: discard an unstaged edit'
printf 'unwanted replacement\n' > "$demo_dir/notes.txt"
git -C "$demo_dir" restore notes.txt
printf '%s\n' 'File after restore:'
cat "$demo_dir/notes.txt"

printf '%s\n' '--- annotated tag: mark the demo state'
git -C "$demo_dir" tag -a demo-v1.0 -m "Exercise 04 demo tag"
printf 'Tag object type: %s\n' "$(git -C "$demo_dir" cat-file -t refs/tags/demo-v1.0)"
git -C "$demo_dir" tag --list
