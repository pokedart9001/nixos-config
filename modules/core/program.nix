{
  pkgs,
  username,
  ...
}: {
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.dconf.enable = true;
  programs.zsh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };

  programs.seahorse.enable = true;

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [username];
  };
  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        floorp
      '';
      mode = "0755";
    };
  };

  programs.hyprland.enable = true;

  programs.i3lock = {
    enable = true;
    package = pkgs.i3lock-color;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
  };
}
