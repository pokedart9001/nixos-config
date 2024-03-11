{pkgs, ...}: {
    services.picom = {
        enable = true;

        vSync = true;
        backend = "glx";

        fade = true;
        fadeSteps = [0.07 0.07];

        settings = {
            corner-radius = 10;

            blur.method = "dual_kawase";
            blur.strength = 2;
            blur-background-exclude = [
                "window_type = 'dock'"
                "window_type = 'desktop'"
                "_GTK_FRAME_EXTENTS"
                "class_g = 'Chromium'"
                "class_g = 'Discord'"
                "class_g = 'Dunst'"
                "class_g = 'Peek'"
                "class_g *?= 'escrotum'"
                "QTILE_INTERNAL = 1"
            ];

            rounded-corners-exclude = [
                "class_g *?= 'escrotum'"
            ];
        };
    };
}
