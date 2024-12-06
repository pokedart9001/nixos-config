{pkgs, ...}: {
    home.packages = with pkgs; [
        alsa-utils # Needed for Qtile volume control via amixer
    ];

    xdg.configFile."qtile/config.py".source = ./config.py;
}
