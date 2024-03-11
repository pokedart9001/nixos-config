{
  inputs,
  nixpkgs,
  nixpkgs-unstable,
  self,
  username,
  system,
  flakeDir,
  ...
}: let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
  unstable-overlay = final: prev: let
    unstablePkgs = import nixpkgs-unstable {
      inherit (prev) system;
      config.allowUnfree = true;
    };
  in {
    unstable = unstablePkgs;
    zfsUnstable = unstablePkgs.zfsUnstable;
  };
in {
  nixos = lib.nixosSystem {
    specialArgs = {
      inherit self inputs username system flakeDir unstable-overlay;
      channels = {inherit nixpkgs nixpkgs-unstable;};
    };
    modules = [
      inputs.catppuccin.nixosModules.catppuccin
      (import ./bootloader.nix)
      (import ./hardware.nix)
      (import ./xserver.nix)
      (import ./steam.nix)
      (import ./network.nix)
      (import ./pipewire.nix)
      (import ./program.nix)
      (import ./../home/packages/python.nix)
      (import ./security.nix)
      (import ./services.nix)
      (import ./system.nix)
      (import ./user.nix)
      (import ./xdgportal.nix)
      (import ./cloudflare-warp.nix)
      (import ./../../hosts/nixos/hardware-configuration.nix)
    ];
  };
}
