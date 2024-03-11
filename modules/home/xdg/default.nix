{config, ...}: {
  xdg.enable = true;

  xdg.userDirs = {
    createDirectories = true;

    publicShare = null;
    templates = null;
  };

  home.file."Pictures/wallpapers".source = ./wallpapers;
}
