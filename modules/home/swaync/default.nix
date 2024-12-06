{lib, ...}: {
  services.swaync = {
    enable = true;
    style = ./style.css;

    settings = import ./config.nix;
  };
}
