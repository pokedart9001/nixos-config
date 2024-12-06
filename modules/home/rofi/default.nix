{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  xdg.configFile."rofi/config".source = ./config;
}
