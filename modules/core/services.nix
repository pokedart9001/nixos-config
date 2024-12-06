{
  pkgs,
  username,
  ...
}: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    blueman.enable = true;

    syncthing = {
      enable = true;
      user = username;
      dataDir = "/home/${username}";

      overrideFolders = false;
      overrideDevices = false;
    };

    libinput.enable = true;
    udev.packages = with pkgs; [
      via
    ];

    displayManager.defaultSession = "qtile";
  };
}
