{pkgs, ...}: {
    xdg.icons.enable = true;
    environment.systemPackages = with pkgs; [
        papirus-icon-theme
    ];

    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        config = {
            common.default = ["gtk"];
            hyprland.default = [
                "gtk"
                "hyprland"
            ];
        };

        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        ];
    };

    environment.variables = {
        CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
        GNUPGHOME = "$XDG_DATA_HOME/gnupg";
        XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose";
        PARALLEL_HOME = "$XDG_CONFIG_HOME/parallel";
    };
}
