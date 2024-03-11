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

    xdg.configFile."hypr/mocha.conf".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/catppuccin/hyprland/refs/heads/main/themes/mocha.conf";
        hash = "sha256-SxVNvZZjfuPA2yB9xA0EHHEnE9eIQJAFVBIUuDiSIxQ=";
    };

    xdg.configFile."hypr/xdph.conf".text = ''
        screencopy {
            allow_token_by_default = true
        }
    '';

    xdg.configFile."hypr/hyprtoolkit.conf".text = ''
        background=0xff11111b
        base=0xff1e1e2e
        alternate_base=0xff181825
        text=0xffcdd6f4
        bright_text=0xffbac2de
        accent=0xffb4befe
        accent_secondary=0xffb4befe
        icon_theme=Papirus-Dark
    '';
}
