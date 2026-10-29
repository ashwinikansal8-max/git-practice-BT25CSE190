#!/usr/bin/env bash

file="${1:-input.txt}"

if [[ ! -f "$file" ]]; then
    printf "Error: input file '%s' not found\n" "$file" >&2
    exit 1
fi

read -r lines words characters < <(wc -l -w -m < "$file")

printf 'File:       %s\n' "$file"
printf 'Lines:      %s\n' "$lines"
printf 'Words:      %s\n' "$words"
printf 'Characters: %s\n' "$characters"
