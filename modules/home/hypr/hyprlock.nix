{
    programs.hyprlock = {
        enable = true;

        settings = {
            source = "$HOME/.config/hypr/mocha.conf";

            "$accent" = "$lavender";
            "$font" = "Inter";

            # GENERAL
            general = {
                disable_loading_bar = true;
                ignore_empty_input = true;
                immediate_render = true;
                hide_cursor = true;
            };

            # BACKGROUND
            background = [
                {
                    monitor = "";
                    path = "${../xdg/wallpapers/catppuccin/astronaut.png}";
                    blur_passes = 1;
                    blur_size = 2;
                    color = "$base";
                }
            ];

            label = [
                # TIME
                {
                    monitor = "";
                    text = "$TIME12";
                    color = "$mauve";
                    font_size = 70;
                    font_family = "$font";
                    position = "-30, -20";
                    halign = "right";
                    valign = "top";
                    shadow_passes = 2;
                }

                # DATE
                {
                    monitor = "";
                    text = "cmd[update:43200000] date +\"%A, %B %d %Y\"";
                    color = "$mauve";
                    font_size = 25;
                    font_family = "$font";
                    position = "-30, -140";
                    halign = "right";
                    valign = "top";
                    shadow_passes = 2;
                }

                # GREETING
                {
                    monitor = "";
                    text = "Hello,<sub> </sub>$DESC";
                    color = "$text";
                    font_size = 35;
                    font_family = "$font";
                    position = "0, 65";
                    halign = "center";
                    valign = "center";
                    shadow_passes = 2;
                }
            ];

            image = [
                # USER AVATAR
                {
                    monitor = "";
                    path = "${../xdg/face.icon}";
                    size = 100;
                    border_color = "$accent";
                    border_size = 2;
                    position = "0, 170";
                    halign = "center";
                    valign = "center";
                }
            ];

            input-field = [
                # INPUT FIELD
                {
                    monitor = "";
                    size = "350, 60";
                    outline_thickness = 4;
                    dots_size = 0.2;
                    dots_spacing = 0.2;
                    dots_center = true;
                    outer_color = "$accent";
                    inner_color = "$surface0";
                    font_family = "$font";
                    font_color = "$text";
                    fade_on_empty = false;
                    placeholder_text = ''<span foreground="##$textAlpha"><i>󰌾  Logged in as </i><span foreground="##$lavenderAlpha">$USER</span></span>'';
                    hide_input = false;
                    check_color = "$accent";
                    fail_color = "$red";
                    fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
                    capslock_color = "$yellow";
                    position = "0, -47";
                    halign = "center";
                    valign = "center";
                }
            ];
        };
    };
}
