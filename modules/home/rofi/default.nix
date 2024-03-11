{pkgs, ...}: {
  programs.rofi = {
    enable = true;
  };

  xdg.configFile."rofi/config".source = ./config;
}
