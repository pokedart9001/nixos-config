{
    xdg = {
        enable = true;

        mimeApps = {
            enable = true;
            defaultApplications = {
                "inode/directory" = ["nemo.desktop"];
            };
        };

        userDirs = {
            createDirectories = true;

            publicShare = null;
            templates = null;
        };
    };

    home.file."Pictures/wallpapers".source = ./wallpapers;
    home.file.".face.icon".source = ./face.icon;
}
