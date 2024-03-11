{
    services.xserver = {
        enable = true;
        xkb.layout = "us";
        xkb.options = "compose:caps";

        videoDrivers = ["nvidia"];

        desktopManager.runXdgAutostartIfNone = true;
    };

    # To prevent getting stuck at shutdown
    systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
