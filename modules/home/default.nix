{
  imports = [
    (import ./floorp) # firefox based browser
    (import ./krita) # image editor
    (import ./nitch) # system fetch tool
    (import ./picom) # X11 compositor
    (import ./qtile) # window manager
    (import ./rofi) # launcher
    (import ./scripts) # personal scripts
    (import ./xdg) # file/directory specification

    (import ./packages) # other packages

    (import ./bat.nix) # better cat command
    (import ./btop.nix) # system resource monitor
    (import ./cava.nix) # audio visualizer
    (import ./catppuccin.nix) # catppuccin module settings
    (import ./discord.nix) # discord with audio screensharing
    (import ./dunst.nix) # notification deamon
    (import ./famistudio.nix) # nes music editor
    (import ./fzf.nix) # fuzzy finder
    (import ./gaming.nix) # packages related to gaming
    (import ./git.nix) # version control
    (import ./gtk.nix) # gtk + cursor settings
    (import ./kitty.nix) # terminal
    (import ./micro.nix) # nano replacement
    (import ./nvim.nix) # neovim editor
    (import ./obs-studio.nix) # screen recording suite
    (import ./starship.nix) # fancy shell prompt
    (import ./tidal.nix) # high-quality music streaming
    (import ./vscodium.nix) # text editor/ide
    (import ./zsh.nix) # shell
  ];
}
