#!/usr/bin/env bash

CHOICE=$(echo -e "󰐥 Shutdown\n󰤄 Sleep\n󰍃 Logout" | dmenu)

if [[ $CHOICE == "󰐥 Shutdown" ]]; then
	shutdown now
elif [[ $CHOICE == "󰤄 Sleep" ]]; then
	systemctl suspend
elif [[ $CHOICE == "󰍃 Logout" ]]; then
	qtile cmd-obj -o cmd -f shutdown
fi
