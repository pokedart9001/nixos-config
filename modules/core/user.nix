{
  pkgs,
  inputs,
  username,
  description,
  ...
}: let
  packages = with pkgs; [
    fish
  ];
in {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs username;};
    users.${username} = {
      imports = [
        (import ./../home)
        inputs.catppuccin.homeManagerModules.catppuccin
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
