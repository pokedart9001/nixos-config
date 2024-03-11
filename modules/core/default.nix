{
    inputs,
    nixpkgs,
    self,
    username,
    description,
    system,
    ...
}: {
    nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
            inherit self inputs username description system;
            channels = {inherit nixpkgs;};
        };
        modules = [
            inputs.catppuccin.nixosModules.catppuccin
            (import ./audio.nix)
            (import ./bootloader.nix)
            (import ./hardware.nix)
            (import ./xserver.nix)
            (import ./steam.nix)
            (import ./network.nix)
            (import ./program.nix)
            (import ./security.nix)
            (import ./services.nix)
            (import ./system.nix)
            (import ./user.nix)
            (import ./xdgportal.nix)
            (import ./../../hosts/nixos/hardware-configuration.nix)
        ];
    };
}
