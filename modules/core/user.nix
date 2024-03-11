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
                inputs.nvf.homeManagerModules.default
            ];
            home = {
                username = "${username}";
                homeDirectory = "/home/${username}";
                stateVersion = "23.11";
            };
            programs.home-manager.enable = true;
        };
    };

    users.users.${username} = {
        isNormalUser = true;
        description = "${description}";
        extraGroups = ["networkmanager" "wheel" "libvirtd"];
        shell = pkgs.zsh;
    };

    nix.settings.allowed-users = ["${username}"];
}
