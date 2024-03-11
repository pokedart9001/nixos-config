#!/usr/bin/env bash

set -Eeuo pipefail

qs ipc call dmenu open "$(</dev/stdin)"
sleep 0.05
RESULT="$(qs ipc wait dmenu receive)"

[[ -e $RESULT ]] && echo "$RESULT" || exit 1
