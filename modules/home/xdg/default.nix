{
    xdg = {
        enable = true;

        mimeApps = {
            enable = true;
            defaultApplications = {
                "inode/directory" = ["nemo.desktop"];
                "x-scheme-handler/http" = ["zen-beta.desktop"];
                "x-scheme-handler/https" = ["zen-beta.desktop"];
            };
        };

        userDirs = {
            createDirectories = true;

            publicShare = null;
            templates = null;
        };
    };

    home.file = {
        "Pictures/wallpapers".source = ./wallpapers;
        ".face.icon".source = ./face.icon;
    };
}
