{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
  ];

  xdg.configFile."vesktop/themes/catppuccin-mocha.css".source = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/discord/main/themes/mocha.theme.css";
    sha256 = "sha256:1w921c6zg5xvkf52x642psnqpaannbd28cc37dfzasbplw7ghl2x";
  };
}
