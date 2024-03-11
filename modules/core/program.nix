{
  pkgs,
  username,
  flakeDir,
  ...
}: {
  programs.dconf.enable = true;
  programs.zsh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };

  programs.i3lock = {
    enable = true;
    package = pkgs.i3lock-color;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = /. + builtins.toPath flakeDir;
  };

  programs.noisetorch.enable = true;
}
