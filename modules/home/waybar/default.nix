{
    programs.waybar = {
        enable = true;

        settings.mainBar = import ./config.nix;
        style = ./style.css;

        systemd.enable = true;
    };
}
