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

    ollama = {
      enable = true;
      package = pkgs.ollama;
      acceleration = "cuda";
    };
    open-webui = {
      enable = true;
      package = pkgs.open-webui;
      port = 11111;
    };

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
