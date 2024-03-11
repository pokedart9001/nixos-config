{
  config,
  pkgs,
  inputs,
  ...
}: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;

      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };

    nvidia = {
      open = false;

      modesetting.enable = true;
      powerManagement.enable = false;

      nvidiaSettings = true;
      nvidiaPersistenced = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
  hardware.xpadneo.enable = true;
  hardware.cpu.amd.updateMicrocode = true;

  powerManagement.cpuFreqGovernor = "performance";
}
