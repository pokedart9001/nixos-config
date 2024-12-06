{
  config,
  pkgs,
  ...
}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";

    systemd-boot.enable = false;

    grub = {
      enable = true;

      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 10;

      font = "${pkgs.nerdfonts}/share/fonts/NerdFonts/JetBrainsMonoNerdFont-Regular.ttf";
      fontSize = 48;
      splashImage = null;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"];

  boot.initrd.systemd = {
    enable = true;
    dbus.enable = true;
  };
}
