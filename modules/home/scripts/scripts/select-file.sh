#!/usr/bin/env bash

DIR="$1"
shift

touch "$DIR"/marker && rm "$DIR"/marker &
zenity --file-selection --filename "$DIR"/marker "$@"

