{
  config,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;

    iconTheme = {
      name = config.gtk.iconTheme.name;
      package = config.gtk.iconTheme.package;
    };

    settings = {
      global = {
        font = "JetBrainsMono Nerd Font 12";
        corner_radius = 10;
        frame_width = 1;
        mouse_left_click = "do_action, close_current";

        frame_color = "#89b4fa";
        separator_color = "frame";
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
      };
    };
  };
}
