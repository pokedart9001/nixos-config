{pkgs, ...}: {
  catppuccin = let
    accent = "lavender";
  in {
    bat.enable = true;
    btop.enable = true;
    cava.enable = true;
    fzf.enable = true;

    gtk = {
      enable = true;
      inherit accent;

      icon.enable = true;
      icon.accent = accent;
    };

    kitty.enable = true;

    micro.enable = true;
    nvim.enable = true;
    obs.enable = true;

    starship.enable = true;

    waybar = {
      enable = true;
      mode = "createLink";
    };

    wlogout = {
      enable = true;
      inherit accent;
    };
  };
}
