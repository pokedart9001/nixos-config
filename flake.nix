{
  description = "pokedart9001's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-sgdboop.url = "github:Saturn745/nixpkgs/sgdboop-init";
    nur.url = "github:nix-community/NUR";

    nix-gaming.url = "github:fufexan/nix-gaming";
    slippi.url = "github:lytedev/slippi-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qtile = {
      url = "github:qtile/qtile/v0.31.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
