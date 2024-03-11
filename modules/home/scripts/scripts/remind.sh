#!/usr/bin/env bash

REMINDER=$1
if [ -z "$REMINDER" ]; then
    echo "No reminder text specified"
    exit 1
fi
shift

COMMAND="notify-send -e 'Reminder' '$REMINDER' --icon='appointment-new'"
echo "$COMMAND" | at "$@"
