{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerdfonts
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    twemoji-color-font
    noto-fonts-emoji
  ];

  catppuccin.pointerCursor = {
    enable = true;
    accent = "dark";
  };

  home.pointerCursor.size = 22;
  home.pointerCursor.gtk.enable = true;

  gtk = {
    enable = true;

    catppuccin = {
      enable = true;
      accent = "lavender";

      icon.enable = true;
      icon.accent = "lavender";
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";

    style = {
      name = "kvantum";
      catppuccin = {
        enable = true;
        accent = "lavender";
      };
    };
  };
}
