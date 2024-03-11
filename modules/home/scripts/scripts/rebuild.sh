#!/usr/bin/env bash

cd ~/nixos-config || exit

[[ $1 = "--update" ]] && nix flake update

git add .
git diff --staged -U0 "*"

if systemd-inhibit nh os --elevation-strategy="$(which run0)" switch . $1; then
  notify-send -e "Build Finished" "NixOS Rebuild was successful! Configuration has been updated." --icon=system-reboot

  current=$(nixos-rebuild list-generations | grep current)

  git commit --fixup ":/init" -am "$current"
else
  notify-send -e "Build Failure" "NixOS Rebuild was unsuccessful. Current configuration has errors preventing an update." --icon=dialog-error
fi

cd - || exit
