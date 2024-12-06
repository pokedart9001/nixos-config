{
  description = "pokedart9001's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    nix-gaming.url = "github:fufexan/nix-gaming";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix/v1.1.0";
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    self,
    ...
  } @ inputs: let
    username = "nlevitt";
    description = "Noah Levitt";
    system = "x86_64-linux";

    forAllSystems = nixpkgs.lib.genAttrs [system];
    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    nixosConfigurations = import ./modules/core/default.nix {
      inherit self nixpkgs nixpkgs-unstable inputs username description system;
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
