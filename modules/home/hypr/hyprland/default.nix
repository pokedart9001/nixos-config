{
    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;

        systemd.variables = ["--all"];
        configType = "hyprlang";
        extraConfig = builtins.readFile ./hyprland.conf;
    };
}
