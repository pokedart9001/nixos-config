{
    catppuccin = rec {
        accent = "lavender";

        bat.enable = true;
        btop.enable = true;
        cava.enable = true;
        fzf.enable = true;

        gtk = {
            enable = true;
            accent = accent;

            icon.enable = true;
        };

        imv.enable = true;
        kitty.enable = true;
        micro.enable = true;
        mpv.enable = true;
        nvim.enable = true;
        obs.enable = true;
        starship.enable = true;
        vesktop.enable = true;

        waybar = {
            enable = true;
            mode = "createLink";
        };

        wlogout.enable = true;
    };
}
