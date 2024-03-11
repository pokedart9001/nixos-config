{
    pkgs,
    username,
    ...
}: {
    programs = {
        appimage = {
            enable = true;
            binfmt = true;
        };

        nix-ld = {
            enable = true;
            libraries = with pkgs; [
                fontconfig
                libcxx
                libglvnd
                libpulseaudio
                libvlc
                libxkbcommon
                xorg.libX11
                xorg.libXcursor
                xorg.libXi
                SDL2
                wayland
            ];
        };

        dconf.enable = true;
        zsh.enable = true;

        nm-applet.enable = true;
        arp-scan.enable = true;

        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
            # pinentryFlavor = "";
        };

        seahorse.enable = true;

        _1password.enable = true;
        _1password-gui = {
            enable = true;
            polkitPolicyOwners = [username];
        };

        hyprland.enable = true;

        i3lock = {
            enable = true;
            package = pkgs.i3lock-color;
        };

        nh = {
            enable = true;
            clean.enable = true;
        };

        virt-manager.enable = true;
        wshowkeys.enable = true;
        zoom-us.enable = true;
    };

    virtualisation.libvirtd.enable = true;

    environment.etc = {
        "1password/custom_allowed_browsers" = {
            text = ''
                floorp
                zen
            '';
            mode = "0755";
        };
    };
}
