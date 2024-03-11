{pkgs, ...}: {
  boot.loader = {
    efi.canTouchEfiVariables = false;

    grub = {
      enable = true;

      devices = ["nodev"];
      efiSupport = true;
      efiInstallAsRemovable = true;
      useOSProber = true;
      configurationLimit = 10;

      font = "${pkgs.nerdfonts}/share/fonts/NerdFonts/JetBrainsMonoNerdFont-Regular.ttf";
      fontSize = 48;
      splashImage = null;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages;

  boot.initrd.systemd = {
    enable = true;
    dbus.enable = true;
  };
}
