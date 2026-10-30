#!/usr/bin/env bash
set -u

conf="${1:-settings.conf}"

if [[ ! -f "$conf" ]]; then
    printf "Error: settings file '%s' not found\n" "$conf" >&2
    exit 1
fi

greeting=""
casual_greeting=""

while IFS= read -r line || [[ -n "$line" ]]; do
    line=${line%$'\r'}
    [[ -z "$line" || "$line" == \#* ]] && continue

    if [[ "$line" != *=* ]]; then
        printf "Error: invalid setting in '%s': %s\n" "$conf" "$line" >&2
        exit 1
    fi

    key=${line%%=*}
    value=${line#*=}

    case "$key" in
        greeting)
            greeting=$value
            ;;
        casual_greeting)
            casual_greeting=$value
            ;;
        *)
            printf "Error: unknown setting '%s' in '%s'\n" "$key" "$conf" >&2
            exit 1
            ;;
    esac
done < "$conf"

if [[ -z "${greeting//[[:space:]]/}" ]]; then
    printf "Error: required setting 'greeting' is empty or missing in '%s'\n" "$conf" >&2
    exit 1
fi

printf 'Greeting: %s\n' "$greeting"
if [[ -n "${casual_greeting//[[:space:]]/}" ]]; then
    printf 'Casual greeting: %s\n' "$casual_greeting"
fi
