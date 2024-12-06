#!/usr/bin/env bash

MODEL="$(ollama list | tail -n +2 | awk '{print $1}' | fzf)"
if [[ ! -z $MODEL ]]; then
    ollama run $MODEL
fi 