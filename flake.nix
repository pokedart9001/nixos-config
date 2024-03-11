{
    description = "pokedart9001's NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nur.url = "github:nix-community/NUR";
        nix-gaming.url = "github:fufexan/nix-gaming";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                home-manager.follows = "home-manager";
            };
        };

        nvf = {
            url = "github:notashelf/nvf";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nil.url = "github:oxalica/nil";

        grim-hyprland.url = "github:eriedaberrie/grim-hyprland";

        catppuccin.url = "github:catppuccin/nix";
    };

    outputs = {
        nixpkgs,
        self,
        ...
    } @ inputs: let
        username = "nlevitt";
        description = "Noah";
        system = "x86_64-linux";

        forAllSystems = nixpkgs.lib.genAttrs [system];
        nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
    in {
        nixosConfigurations = import ./modules/core/default.nix {
            inherit self nixpkgs inputs username description system;
        };

        packages = forAllSystems (system: let
            pkgs = nixpkgsFor.${system};
        in {
            default = self.packages.${system}.install;

            install = pkgs.writeShellApplication {
                name = "install";
                runtimeInputs = with pkgs; [git nh];
                text = builtins.readFile ./install.sh;
            };
        });

        apps = forAllSystems (system: {
            default = self.apps.${system}.install;

            install = {
                type = "app";
                program = "${self.packages.${system}.install}/bin/install";
            };
        });
    };
}
