{pkgs, ...}: {
    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;

        plugins = [
            (pkgs.callPackage ./hyprglass.nix {})
        ];

        systemd.variables = ["--all"];
        extraConfig = builtins.readFile ./hyprland.conf;
    };
}
