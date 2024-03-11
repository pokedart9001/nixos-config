{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    catppuccin.enable = true;

    vimAlias = true;
  };
}
