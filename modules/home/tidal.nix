{pkgs, ...}: {
    home.packages = with pkgs; [
        tidal-hifi
    ];

    xdg.configFile."tidal-hifi/themes/rosepine.css".source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/rose-pine/tidal/main/tidal.rosepine.css";
        sha256 = "sha256:1k89nz3ik2h2406ndgi9gbqyhihx4yv27k9wvssmawrxib8p2f72";
    };
}
