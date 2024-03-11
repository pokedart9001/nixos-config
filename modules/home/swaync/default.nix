{
    services.swaync = {
        enable = false;

        settings = import ./config.nix;
        style = ./style.css;
    };
}
