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
  };
}
