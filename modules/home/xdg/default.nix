{config, ...}: {
  xdg.enable = true;

  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = ["nemo.desktop"];
    };
  };

  xdg.userDirs = {
    createDirectories = true;

    publicShare = null;
    templates = null;
  };

  home.file."Pictures/wallpapers".source = ./wallpapers;
}
