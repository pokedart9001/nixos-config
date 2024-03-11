{
    imports = [
        (import ./browser) # zen browser
        (import ./hypr) # wayland compositor
        (import ./krita) # image editor
        (import ./nitch) # system fetch tool
        # (import ./picom) # X11 compositor
        # (import ./qtile) # X11 window manager
        (import ./rofi) # launcher
        (import ./scripts) # personal scripts
        (import ./swaync) # wayland notification center
        (import ./waybar) # wayland status bar
        (import ./xdg) # file/directory specification

        (import ./bat.nix) # better cat command
        (import ./btop.nix) # system resource monitor
        (import ./cava.nix) # audio visualizer
        (import ./catppuccin.nix) # catppuccin module settings
        (import ./discord.nix) # discord with audio screensharing
        (import ./easyeffects.nix) # pipewire audio input effects
        (import ./famistudio.nix) # nes music editor
        (import ./fzf.nix) # fuzzy finder
        (import ./gaming.nix) # packages related to gaming
        (import ./git.nix) # version control
        (import ./gtk.nix) # gtk + cursor settings
        (import ./kitty.nix) # terminal
        (import ./micro.nix) # nano replacement
        (import ./nvim.nix) # neovim editor
        (import ./obs-studio.nix) # screen recording suite
        (import ./opencode.nix) # ai coding agent tui
        (import ./starship.nix) # fancy shell prompt
        (import ./tidal.nix) # high-quality music streaming
        (import ./zsh.nix) # shell

        (import ./packages.nix) # other packages
    ];
}
