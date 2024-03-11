{pkgs, ...}: {
    imports = [
        ./hyprland
        ./packages

        ./hypridle.nix
        ./hyprlock.nix
        ./hyprlauncher.nix
    ];

    home.sessionVariables = {
        NIXOS_OZONE_WL = 1;
        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        QT_QUICK_CONTROLS_STYLE = "org.hyprland.style";

        LIBVA_DRIVER_NAME = "nvidia";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        NVD_BACKEND = "direct";
        CLUTTER_BACKEND = "wayland";

        XCURSOR_SIZE = 24;
        HYPRCURSOR_SIZE = 24;
    };

    xdg.configFile = {
        "hypr/mocha.conf".source = pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/catppuccin/hyprland/refs/heads/main/themes/mocha.conf";
            hash = "sha256-SxVNvZZjfuPA2yB9xA0EHHEnE9eIQJAFVBIUuDiSIxQ=";
        };

        "hypr/hyprtoolkit.conf".source = pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/SchweGELBin/catppuccin-hyprtoolkit/refs/heads/main/themes/mocha/lavender.conf";
            hash = "sha256-5MVwLXuZlNEguWpkyMwo3ie3sEQnGEziGL/uttOZJKA=";
        };

        "hypr/application-style.conf".text = ''
            roundness = 2
        '';

        "hypr/xdph.conf".text = ''
            screencopy {
                allow_token_by_default = true
            }
        '';
    };
}
