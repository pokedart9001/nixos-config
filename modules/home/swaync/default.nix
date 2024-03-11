{
    services.swaync = {
        enable = true;

        settings = import ./config.nix;
        style = ./style.css;
    };
}
