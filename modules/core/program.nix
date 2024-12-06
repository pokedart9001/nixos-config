{
  pkgs,
  username,
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
  };

  programs.noisetorch.enable = true;
}
