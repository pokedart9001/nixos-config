{
  pkgs,
  inputs,
  system,
  username,
  description,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs username system;};
    users.${username} = {
      imports = [
        (import ./../home)
        inputs.catppuccin.homeModules.catppuccin
        inputs.slippi.homeManagerModules.default
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${description}";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  nix.settings.allowed-users = ["${username}"];
}
