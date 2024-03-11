{pkgs, ...}: {
    fonts.fontconfig = {
        enable = true;
        hinting = "full";
        antialiasing = true;
        subpixelRendering = "rgb";

        defaultFonts = {
            serif = ["Poly"];
            sansSerif = ["Inter"];
            monospace = ["CommitMono Nerd Font"];
            emoji = ["Twitter Color Emoji" "Noto Color Emoji"];
        };
    };

    home.packages = with pkgs; [
        poly
        inter
        nerd-fonts.commit-mono
        nerd-fonts.symbols-only
        twemoji-color-font
        noto-fonts-color-emoji
        noto-fonts-cjk-sans
    ];

    home.pointerCursor = {
        name = "catppuccin-mocha-dark-cursors";
        package =
            (pkgs.catppuccin-cursors.overrideAttrs rec {
                version = "0.4.0";
                src = pkgs.fetchFromGitHub {
                    owner = "catppuccin";
                    repo = "cursors";
                    rev = "v${version}";
                    hash = "sha256-VxLwZkZdV1xH4jeqtszqSnhNrgF3uamEXBLPKIc4lXE=";
                };

                outputs = ["mochaDark" "out"];
            }).mochaDark;

        size = 22;
        gtk.enable = true;
    };

    gtk = rec {
        enable = true;
        colorScheme = "dark";

        theme = {
            name = "Colloid-Dark-Catppuccin";
            package = pkgs.colloid-gtk-theme.override {
                colorVariants = ["dark"];
                tweaks = [
                    "catppuccin"
                    "black"
                    "rimless"
                ];
            };
        };

        gtk4.theme = theme;

        iconTheme = {
            name = "Colloid-Catppuccin-Dark";
            package = pkgs.colloid-icon-theme.override {
                schemeVariants = ["catppuccin"];
            };
        };

        font = {
            name = "Inter";
            size = 9.5;
        };

        gtk3.extraConfig = {
            gtk-menu-images = 1;
        };
    };

    qt = {
        enable = true;

        platformTheme.name = "gtk3";
        style = {
            name = "org.hyprland.style";
            package = pkgs.hyprland-qt-support;
        };
    };

    dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}
