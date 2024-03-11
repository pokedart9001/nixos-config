{pkgs, ...}: {
  home.packages = with pkgs; [
    arrpc # enable rich presence
    (unstable.vesktop.override {
      vencord = unstable.vencord;
      withSystemVencord = false;
    })
  ];

  xdg.configFile."vesktop/themes/catppuccin-mocha.css".source = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/discord/main/themes/mocha.theme.css";
    sha256 = "sha256:1w921c6zg5xvkf52x642psnqpaannbd28cc37dfzasbplw7ghl2x";
  };

  xdg.configFile."vesktop/themes/hideUsers.css".text = ''
    /**
    * @name Hide Users
    * @author Bates
    * @authorId 137259132305539072
    * @description Collapses the user list and expands it on hover
    * @website https://github.com/B4T3S/DiscordDarkNeon
    * @invite 6qd3SkP6Ch
    */

    @import url('https://b4t3s.github.io/DiscordDarkNeon/css/hideUsers.css');

    :root {
      --transition-time: .2s;
    }
  '';
}
