#!/usr/bin/env bash

# cd to config dir
cd ~/nixos-config || exit

# Stage nix files for rebuild
# (will not track properly otherwise)
git add .

# Show staged changes
git diff --staged -U0 "*"

sudo echo "NixOS Rebuilding..."
if nh os switch . $1; then
  # Notify success
  notify-send -e "Build Finished" "NixOS Rebuild was successful! Configuration has been updated." --icon=system-software-update

  # Get current generation metadata
  current=$(nixos-rebuild list-generations | grep current)

  # Commit all changes with the generation metadata
  git commit --fixup ":/init" -am "$current"
else
  # Notify failure
  notify-send -e "Build Failure" "NixOS Rebuild was unsuccessful. Current configuration has errors preventing an update." --icon=dialog-error
fi

# Back to previous dir
cd - || exit
