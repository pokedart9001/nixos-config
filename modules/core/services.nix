{
    config,
    pkgs,
    username,
    ...
}: {
    services = {
        atd.enable = true;
        blueman.enable = true;
        dbus.enable = true;
        fwupd.enable = true;
        gnome.gnome-keyring.enable = true;
        gvfs.enable = true;

        logind.settings.Login = {
            HandlePowerKey = "suspend";
            HandlePowerKeyLongPress = "poweroff";
        };

        ollama = {
            enable = true;
            package = pkgs.ollama-cuda;
        };
        open-webui = {
            enable = true;
            port = 11111;
        };

        syncthing = {
            enable = true;
            user = username;
            dataDir = "/home/${username}";

            overrideFolders = false;
            overrideDevices = false;
        };

        libinput.enable = true;
        udev.packages = with pkgs; [
            via
        ];

        joycond.enable = true;

        hardware.openrgb = {
            enable = true;
            package = pkgs.openrgb-with-all-plugins;
        };

        displayManager = {
            sddm = {
                enable = true;
                wayland.enable = true;

                package = pkgs.kdePackages.sddm;

                settings = {
                    Theme = let
                        user-settings = config.home-manager.users.${username};
                    in {
                        CursorTheme = user-settings.home.pointerCursor.name;
                        CursorSize = user-settings.home.pointerCursor.size;
                    };
                };
            };

            defaultSession = "hyprland";
            autoLogin.user = username;
        };
    };

    catppuccin.sddm = {
        enable = true;
        accent = "lavender";

        font = "Inter";
        fontSize = "11";
        background = "${../home/xdg/wallpapers/catppuccin/astronaut.png}";
        loginBackground = true;

        clockEnabled = true;
        userIcon = true;
    };
}
