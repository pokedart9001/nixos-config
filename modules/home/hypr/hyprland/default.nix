{
    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;

        systemd.variables = ["--all"];
        extraConfig = builtins.readFile ./hyprland.conf;
    };
}
