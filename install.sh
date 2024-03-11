#!/usr/bin/env bash

confirm() {
  echo -en "[y/n]: "
  read -n 1 -r
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 0
  fi
  echo
}

print_header() {
  printf "
               ___           _   ___           _              
              | __| _ ___ __| |_|   \ __ _ _ _| |_            
              | _| '_/ _ (_-<  _| |) / _\` | '_|  _|           
       _  _ _ |_||_|_\___/__/\__|___/\__,_|_|  \__|_ _       
      | \| (_)_ __/ _ \/ __| |_ _|_ _  __| |_ __ _| | |___ _ _ 
      | .\` | \ \ / (_) \__ \  | || ' \(_-<  _/ _\` | | / -_) '_|
      |_|\_|_/_\_\\\\___/|___/ |___|_||_/__/\__\__,_|_|_\___|_|

  https://github.com/pokedart9001 https://github.com/Frost-Phoenix 

"
}

set_username() {
  CURRENT_USERNAME=$(grep "username =" ./flake.nix | cut -d \" -f 2)
  NEW_USERNAME=$(whoami)

  echo -e "Setting username to \"$NEW_USERNAME...\"\n"
  sed -i "s/${CURRENT_USERNAME}/$NEW_USERNAME/g" ./flake.nix

  CURRENT_DESCRIPTION=$(grep "description =" ./flake.nix | cut -d \" -f 2)
  NEW_DESCRIPTION=$(grep "$(whoami)" </etc/passwd | awk -F ':' '{print $5}')

  echo -e "Setting description to \"$NEW_DESCRIPTION...\"\n"
  sed -i "s/${CURRENT_DESCRIPTION}/$NEW_DESCRIPTION/g" ./flake.nix
}

set_github_username_and_email() {
  CURRENT_GITHUB_USERNAME=$(grep "userName =" ./modules/home/git.nix | cut -d \" -f 2)
  echo -en "Enter your GitHub username: "
  read -r github_username

  echo -e "Setting Github username to \"$github_username...\"\n"
  sed -i "s/${CURRENT_GITHUB_USERNAME}/${github_username}/g" ./modules/home/git.nix

  CURRENT_GITHUB_EMAIL=$(grep "userEmail =" ./modules/home/git.nix | cut -d \" -f 2)
  echo -en "Enter your GitHub email: "
  read -r github_email

  echo -e "Setting Github email to \"$github_email...\"\n"
  sed -i "s/${CURRENT_GITHUB_EMAIL}/${github_email}/g" ./modules/home/git.nix
}

install() {
  # Clone the repo
  git clone https://github.com/pokedart9001/nixos-config ~/nixos-config
  cd ~/nixos-config || exit

  # Get the hardware configuration
  echo -e "Generating hardware configuration...\n"
  nixos-generate-config --show-hardware-config >hosts/nixos/hardware-configuration.nix

  set_username
  set_github_username_and_email

  # Last Confirmation
  echo -en "You are about to start the system build, do you want to proceed? "
  confirm

  # Build the system (flakes + home manager)
  nh os switch .
}

main() {
  print_header
  install
}

main && exit 0
