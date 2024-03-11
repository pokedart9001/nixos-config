{
  config,
  pkgs,
  username,
  ...
}: let
  user-settings = config.home-manager.users.${username};
in {
  services.xserver = {
    enable = true;
    xkb.layout = "us";

    videoDrivers = ["nvidia"];

    displayManager = {
      lightdm.background = ../home/xdg/wallpapers/catppuccin/astronaut.png;
      lightdm.greeters.gtk = {
        iconTheme = user-settings.gtk.iconTheme;
        theme = user-settings.gtk.theme;
        cursorTheme = {
          name = user-settings.home.pointerCursor.name;
          package = user-settings.home.pointerCursor.package;
          size = user-settings.home.pointerCursor.size;
        };

        extraConfig = ''
          font-name = JetBrainsMono Nerd Font 11
        '';

        clock-format = "%I:%M %p";
        indicators = [
          "~host"
          "~session"
          "~spacer"
          "~clock"
          "~power"
        ];
      };
    };

    windowManager.qtile = {
      enable = true;
      extraPackages = pythonPackages:
        with pythonPackages; [
          qtile-extras
          iwlib
          pyxdg
        ];
    };

    desktopManager.runXdgAutostartIfNone = true;
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
