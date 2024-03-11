{
    config,
    pkgs,
    username,
    ...
}: {
    services = {
        gvfs.enable = true;
        gnome.gnome-keyring.enable = true;
        dbus.enable = true;
        blueman.enable = true;

        logind = {
            powerKey = "suspend";
            powerKeyLongPress = "poweroff";
        };

        # Currently broken
        # ollama = {
        #     enable = true;
        #     package = pkgs.ollama;
        #     acceleration = "cuda";
        # };
        # open-webui = {
        #     enable = true;
        #     package = pkgs.open-webui;
        #     port = 11111;
        # };

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

        displayManager = {
            sddm = {
                enable = true;
                wayland.enable = true;

                package = pkgs.kdePackages.sddm;
                theme = "catppuccin-mocha";

                settings = {
                    Theme = let
                        user-settings = config.home-manager.users.${username};
                    in {
                        CursorTheme = user-settings.home.pointerCursor.name;
                        CursorSize = user-settings.home.pointerCursor.size;
                    };
                };

                autoLogin.relogin = true;
            };

            defaultSession = "hyprland";
            autoLogin.user = username;
        };
    };

    environment.systemPackages = with pkgs; [
        (
            catppuccin-sddm.override {
                font = "JetBrainsMono Nerd Font";
                fontSize = "11";
                background = "${../home/xdg/wallpapers/catppuccin/astronaut.png}";
                loginBackground = true;
            }
        )
    ];
}
