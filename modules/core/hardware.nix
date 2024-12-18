{
  config,
  pkgs,
  inputs,
  ...
}: {
  hardware = {
    graphics = {
      enable = true;

      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };

    nvidia = {
      open = true;

      modesetting.enable = true;
      powerManagement.enable = true;

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
