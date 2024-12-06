{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-emoji
  ];

  home.pointerCursor = {
    name = "catppuccin-mocha-dark-cursors";
    package =
      (pkgs.catppuccin-cursors.overrideAttrs rec {
        version = "0.4.0";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "cursors";
          rev = "v${version}";
          hash = "sha256-VxLwZkZdV1xH4jeqtszqSnhNrgF3uamEXBLPKIc4lXE=";
        };

        outputs = ["mochaDark" "out"];
      })
      .mochaDark;

    size = 22;

    gtk.enable = true;
  };

  gtk = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";

    style.name = "kvantum";
  };
}
