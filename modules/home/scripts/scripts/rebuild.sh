#!/usr/bin/env bash

# cd to config dir
pushd ~/nixos-config

# Autoformat nix files
if !(alejandra . >/dev/null); then
    pushd
    exit 1
fi

# Stage nix files for rebuild
# (will not track properly otherwise)
git add .

# Show staged changes
git diff --staged -U0 "*"

sudo echo "NixOS Rebuilding..."
if nh os switch . $1; then
    # Notify success
    notify-send -e "NixOS Rebuilt OK!" --icon=system-software-update
    
    # Get current generation metadata
    current=$(nixos-rebuild list-generations | grep current)

    # Commit all changes with the generation metadata
    git commit --fixup current -am "$current"
else
    # Notify failure
    notify-send -e "NixOS Rebuid Failed." --icon=dialog-error
fi

# Back to previous dir
popd