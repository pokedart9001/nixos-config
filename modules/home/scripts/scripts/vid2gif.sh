#!/usr/bin/env bash

palette="/tmp/palette.png"

ffmpeg -v warning -i $1 -vf "palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "[x][1:v] paletteuse" -y $2
