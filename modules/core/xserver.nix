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
    xkb.options = "ctrl:nocaps";

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
          (qtile-extras.overridePythonAttrs
            {
              version = "0.30.0";

              disabledTestPaths = [
                "test/widget/test_alsawidget.py"
                "test/widget/test_githubnotifications.py"
                "test/widget/test_init_configure.py"
                "test/widget/test_iwd.py"
                "test/widget/test_mpris2.py"
                "test/widget/test_strava.py"
                "test/widget/test_tvhwidget.py"
                "test/widget/test_upower.py"
              ];
            })
          iwlib
          pyxdg
          dbus-fast
        ];
    };

    desktopManager.runXdgAutostartIfNone = true;
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
