{
    pkgs,
    username,
    ...
}: {
    services = {
        pulseaudio.enable = false;

        pipewire = {
            enable = true;

            alsa = {
                enable = true;
                support32Bit = true;
            };

            pulse.enable = true;
        };
    };

    users.users.${username}.extraGroups = ["audio"];

    security.sudo.extraConfig = ''
        moritz  ALL=(ALL) NOPASSWD: ${pkgs.systemd}/bin/systemctl
    '';
}
