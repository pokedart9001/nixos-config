<h1 align="center">
   <img src="./.github/assets/logo/nixos-logo.png" width="100px" /> 
   <br>
      pokedart9001's Flakes 
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

   <div align="center">
      <p></p>
      <div align="center">
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-Unstable-blue?style=for-the-badge&logo=NixOS&logoColor=white&labelColor=303446&color=91D7E3">
         </a>
         <a href="https://github.com/pokedart9001/nixos-config/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=F5A97F&logo=unlicense&logoColor=F5A97F&"/>
         </a>
      </div>
      <br>
   </div>
</h1>

<br>
</div>

### 📚 Layout

-   [flake.nix](flake.nix) base of the configuration
-   [hosts](hosts) 🌳 per-host configurations that contain machine specific configurations
    - [nixos](hosts/nixos/) 🖥️ Default host
-   [modules](modules) 🍱 modularized NixOS configurations
    -   [core](modules/core/) ⚙️ Core NixOS configuration
    -   [homes](modules/home/) 🏠 my [Home-Manager](https://github.com/nix-community/home-manager) config
-   [pkgs](flake/pkgs) 📦 packages exported by my flake
-   [wallpapers](modules/home/xdg/wallpapers/) 🌄 wallpapers collection

### 📓 Components
|                             | NixOS + Hyprland                                                                              |
| --------------------------- | :---------------------------------------------------------------------------------------------:
| **Window Manager**          | [Hyprland][Hyprland] |
| **Application Launcher**    | [rofi][rofi] |
| **Notification Daemon**     | [SwayNC][SwayNC] |
| **Terminal Emulator**       | [Kitty][Kitty] |
| **Nix Helper**              | [nh][nh] |
| **Shell**                   | [zsh][zsh] + [oh-my-zsh][oh-my-zsh] + [Starship][Starship] |
| **Text Editor**             | [VSCodium][VSCodium] + [Neovim][Neovim] |
| **Network Management Tool** | [NetworkManager][NetworkManager] + [network-manager-applet][network-manager-applet] |
| **System Resource Monitor** | [Btop][Btop] |
| **File Manager**            | [nemo][nemo] + [yazi][yazi] |
| **Fonts**                   | [Nerd fonts][Nerd fonts] |
| **Color Scheme**            | [Catppuccin][Catppuccin] |
| **Lockscreen**              | [hyprlock][hyprlock] |
| **Image Viewer**            | [imv][imv] |
| **Media Player**            | [mpv][mpv] |
| **Screenshot Software**     | [hyprshot][hyprshot] |
| **Color Picker**            | [hyprpicker][hyprpicker] |


### 📝 Shell aliases

<details>
<summary>
Utils (EXPAND)
</summary>

- ```c```     $\rightarrow$ ```clear```
- ```cd```    $\rightarrow$ ```z```
- ```vim```   $\rightarrow$ ```nvim```
- ```cat```   $\rightarrow$ ```bat```
- ```nano```  $\rightarrow$ ```micro```
- ```icat```  $\rightarrow$ ```kitten icat```
- ```dsize``` $\rightarrow$ ```du -hs```
- ```findw``` $\rightarrow$ ```grep -rl```
- ```ls```    $\rightarrow$ ```eza --icons --group-directories-first -1```
- ```ll```    $\rightarrow$ ```eza --icons  -a --group-directories-first -1 --no-user --long```
- ```tree```  $\rightarrow$ ```eza --icons --tree --group-directories-first```
</details>

<details>
<summary>
Nixos (EXPAND)
</summary>

- ```cdnix```            $\rightarrow$ ```cd ~/nixos-config```
- ```nix-edit```         $\rightarrow$ ```kitty --detach -d ~/nixos-config nvim```
- ```nix-flake-update``` $\rightarrow$ ```sudo nix flake update ~/nixos-config#```
</details>

<details>
<summary>
Git (EXPAND)
</summary>

- ```ga```   $\rightarrow$ ```git add```
- ```gaa```  $\rightarrow$ ```git add --all```
- ```gs```   $\rightarrow$ ```git status```
- ```gb```   $\rightarrow$ ```git branch```
- ```gm```   $\rightarrow$ ```git merge```
- ```gpl```  $\rightarrow$ ```git pull```
- ```gplo``` $\rightarrow$ ```git pull origin```
- ```gps```  $\rightarrow$ ```git push```
- ```gpso``` $\rightarrow$ ```git push origin```
- ```gc```   $\rightarrow$ ```git commit```
- ```gcm```  $\rightarrow$ ```git commit -m```
- ```gr```   $\rightarrow$ ```git restore```
- ```grs```  $\rightarrow$ ```git restore --staged```
- ```gch```  $\rightarrow$ ```git checkout```
- ```gchb``` $\rightarrow$ ```git checkout -b```
- ```gcoe``` $\rightarrow$ ```git config user.email```
- ```gcon``` $\rightarrow$ ```git config user.name```
</details>

### 🛠️ Scripts

All the scripts are in ```modules/home/scripts/scripts/``` and are exported as packages in ```modules/home/scripts/default.nix```

<details>
<summary>
rebuild.sh 
</summary>

**Description:** This script displays a diff of the most recent changes made to `nixos-config`, then runs `nh os switch .`. Upon success, it will automatically create a git commit in `nixos-config` with the current generation number.

Adapted from [NoBoilerplate's NixOS rebuild script](https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5#file-nixos-rebuild-sh).

**Usage:** ```rebuild```
</details>

# 🚀 Installation 

> **⚠️ Use this configuration at your own risk! ⚠️** <br>
> Applying custom configurations, especially those related to your operating system, can have unexpected consequences and may interfere with your system's normal behavior. While I have tested these configurations on my own setup, there is no guarantee that they will work flawlessly on all systems. <br>
> **I am not responsible for any issues that may arise from using this configuration.**

> It is highly recommended to review the configuration contents and make necessary modifications to customize it to your needs before attempting the installation.

1. **Install NixOS**

   First install NixOS using any [graphical ISO image](https://nixos.org/download.html#nixos-iso). 
   > Only been tested using the Gnome graphical installer and choosing the ```No desktop``` option during instalation.
1. **Enter Nix shell with required dependencies**

   ```
   nix-shell -p git -p gh -p nh
   ```
1. **Authenticate Github**
   ```
   gh auth login
   ```
1. **Single-command install script**

   ```
   nix run --experimental-features 'nix-command flakes' git+https://github.com/pokedart9001/nixos-config
   ```
1. **Reboot**

   After rebooting, you'll be greeted by LightDM prompting for your password, with the wallpaper in the background.

### Install script walkthrough

A brief walkthrough of what the install script does.

1. **Set username**

   The script will replace all occurances of the default username ```CURRENT_USERNAME``` by your current one, retrieved via ```$(whoami)```.

1. **Get and set GitHub username and email**

   Next, you will receive a prompt to enter your GitHub username and email, with a confirmation check. Then, it will replace all occurances of the default GitHub username and email ```CURRENT_USERNAME``` and ```CURRENT_USERNAME``` by the given ones stored in ```$github_username``` and ```$github_email```.

1. Get the hardware configuration

   It will also automatically copy the hardware configuration from ```/etc/nixos/hardware-configuration.nix``` to ```./hosts/nixos/hardware-configuration.nix``` so that the hardware configuration used is yours and not the default one.

1. Clone + build the system

   Lastly, it will clone the flake repository into ```~/nixos-config``` and build the system, which includes both the flake config and home-manager config.

# 👥 Credits

- [Frost-Phoenix/nixos-config](https://github.com/Frost-Phoenix/nixos-config)
   - This is where I started my NixOS journey. The status bar design on my repo is based on their older design - personal preference of mine, really. See Frost-Phoenix's repo for more info on sources they've learned/copy from, as well as (probably) more frequent repo updates. Props and cheers for the great work!
- [nomadics9/NixOS-Flake](https://github.com/nomadics9/NixOS-Flake)
   - Where Frost-Phoenix originally started *their* journey. I found this repo before Frost-Phoenix's, but the latter ended up installing more seamlessly for me.


<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>

<div align="right">
  <a href="#readme">Back to the Top</a>
</div>

<!-- Links -->
[Btop]: https://github.com/aristocratos/btop
[Catppuccin]: https://github.com/catppuccin/nix
[Hyprland]: https://github.com/hyprwm/Hyprland
[Kitty]: https://github.com/kovidgoyal/kitty
[Neovim]: https://github.com/neovim/neovim
[Nerd fonts]: https://github.com/ryanoasis/nerd-fonts
[NetworkManager]: https://wiki.gnome.org/Projects/NetworkManager
[Starship]: https://github.com/starship/starship
[SwayNC]: https://github.com/ErikReider/SwayNotificationCenter
[VSCodium]:https://vscodium.com/
[hyprlock]: https://github.com/hyprwm/hyprlock
[hyprpicker]: https://github.com/hyprwm/hyprpicker
[hyprshot]: https://github.com/Gustash/Hyprshot
[imv]: https://sr.ht/~exec64/imv/
[mpv]: https://github.com/mpv-player/mpv
[nemo]: https://github.com/linuxmint/nemo
[network-manager-applet]: https://gitlab.gnome.org/GNOME/network-manager-applet/
[nh]: https://github.com/viperML/nh
[oh-my-zsh]: https://ohmyz.sh/
[rofi]: https://github.com/davatorium/rofi
[yazi]: https://github.com/sxyazi/yazi
[zsh]: https://ohmyz.sh/
