{pkgs, ...}: {
    networking = {
        hostName = "nixos";
        networkmanager = {
            enable = true;
            plugins = with pkgs; [
                networkmanager-openvpn
            ];
        };
        nftables.enable = true;
    };
}
