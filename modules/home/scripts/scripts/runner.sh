#!/usr/bin/env bash

rofi \
	-show run \
	-scroll-method 0 \
	-terminal kitty \
	-sort \
	-match fuzzy \
	-theme "$HOME"/.config/rofi/config/runner.rasi
