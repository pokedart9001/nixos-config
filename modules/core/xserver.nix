{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.options = "compose:caps";

    videoDrivers = ["nvidia"];

    # windowManager.qtile = {
    #   enable = true;
    #   extraPackages = pythonPackages:
    #     with pythonPackages; [
    #       (qtile-extras.overridePythonAttrs {
    #         disabledTestPaths = [
    #           "test/widget/test_alsawidget.py"
    #           "test/widget/test_image.py"
    #           "test/widget/test_init_configure.py"
    #           "test/widget/test_iwd.py"
    #           "test/widget/test_mpris2.py"
    #           "test/widget/test_strava.py"
    #           "test/widget/test_syncthing.py"
    #           "test/widget/test_tvhwidget.py"
    #           "test/widget/test_upower.py"
    #         ];
    #       })
    #       iwlib
    #       pyxdg
    #       dbus-fast
    #     ];
    # };

    desktopManager.runXdgAutostartIfNone = true;
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
