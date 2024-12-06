{pkgs, ...}: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    blueman.enable = true;

    libinput.enable = true;
    udev.packages = with pkgs; [
      via
    ];

    displayManager.defaultSession = "qtile";

    picom = {
      enable = true;
      package = pkgs.unstable.picom;

      vSync = true;
      backend = "glx";

      settings = {
        fading = true;
        "fade-in-step" = 0.07;
        "fade-out-step" = 0.07;

        blur.method = "dual_kawase";
        blur.strength = 2;

        "corner-radius" = 10;
        "blur-background-exclude" = [
          "window_type = 'dock'"
          "window_type = 'desktop'"
          "_GTK_FRAME_EXTENTS@:c"
          "class_g = 'Chromium'"
          "class_g = 'Discord'"
          "class_g = 'Dunst'"
          "class_g = 'Peek'"
          "class_g *?= 'escrotum'"
          "QTILE_INTERNAL:32c = 1"
        ];

        "rounded-corners-exclude" = [
          "class_g *?= 'escrotum'"
        ];
      };
    };
  };
}
