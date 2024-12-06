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

  home.pointerCursor = {
    name = "catppuccin-mocha-dark-cursors";
    package =
      (pkgs.catppuccin-cursors.overrideAttrs (finalAttrs: previousAttrs: {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "cursors";
          rev = "v0.4.0";
          hash = "sha256-VxLwZkZdV1xH4jeqtszqSnhNrgF3uamEXBLPKIc4lXE=";
        };
      }))
      .mochaDark;

    size = 22;

    gtk.enable = true;
  };

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
