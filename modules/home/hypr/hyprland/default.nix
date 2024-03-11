{
    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;

        systemd.variables = ["--all"];
        configType = "lua";
        extraLuaFiles = {
            "modules.monitors" = ./modules/monitors.lua;
            "modules.autostart" = ./modules/autostart.lua;

            "themes.catppuccin" = {
                content = builtins.fetchurl {
                    url = "https://raw.githubusercontent.com/catppuccin/hyprland/refs/heads/main/themes/catppuccin-mocha.lua";
                    sha256 = "sha256:0m9bgksan24mih0ms4w629m9wy7lfb5a96qzph83j2m2mnz101hk";
                };
                autoLoad = false;
            };

            "modules.config.general" = ./modules/config/general.lua;
            "modules.config.decoration" = ./modules/config/decoration.lua;
            "modules.config.layout" = ./modules/config/layout.lua;
            "modules.config.group" = ./modules/config/group.lua;
            "modules.config.input" = ./modules/config/input.lua;
            "modules.config.misc" = ./modules/config/misc.lua;

            "modules.animations" = ./modules/animations.lua;
            "modules.keybinds" = ./modules/keybinds.lua;
            
            "modules.rules.window" = ./modules/rules/window.lua;
            "modules.rules.layer" = ./modules/rules/layer.lua;
        };
    };

    # programs.hyprland-qt-support = {
    #     enable = true;
    #     settings = {
    #         roundness = 2;
    #         border_width = 1;
    #         reduce_motion = false;
    #     };
    # };
}
