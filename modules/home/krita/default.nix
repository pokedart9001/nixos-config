{pkgs, ...}: {
    home.packages = with pkgs; [
        krita
    ];

    xdg.dataFile."krita/color-schemes/CatppuccinMochaLavender.colors".source = ./CatppuccinMochaLavender.colors;
}
