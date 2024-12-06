{
  config,
  pkgs,
  username,
  ...
}: {
  programs.git = {
    enable = true;

    userName = "pokedart9001";
    userEmail = "noahhlevitt@gmail.com";

    aliases = {
      revise = "commit -a --amend --no-edit";
      compress = "!git rebase --autosquash current^; git push -f";
    };

    extraConfig = {
      user.name = "pokedart9001";
      user.email = "noahhlevitt@gmail.com";
      init.defaultBranch = "main";
      credential.helper = "store";
      safe.directory = "~/nixos-config";
    };
  };

  home.packages = with pkgs; [gh lazygit];
}
