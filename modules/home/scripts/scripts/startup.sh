#!/usr/bin/env bash

pkill blueman-applet
pkill nm-applet

xrandr --output HDMI-0 --mode 1920x1080 --rate 75
snixembed --fork

systemctl --user import-environment PATH
systemctl --user restart xdg-desktop-portal.service

nitrogen --restore

blueman-applet & nm-applet &
