{
    services.xserver = {
        enable = true;
        xkb.layout = "us";
        xkb.options = "compose:caps";

        videoDrivers = ["nvidia"];

        # windowManager.qtile = {
        #     enable = true;
        #     extraPackages = pythonPackages:
        #         with pythonPackages; [
        #             qtile-extras
        #             iwlib
        #             pyxdg
        #             dbus-fast
        #         ];
        # };

        desktopManager.runXdgAutostartIfNone = true;
    };

    # To prevent getting stuck at shutdown
    systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
