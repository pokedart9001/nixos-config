{
  config,
  pkgs,
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
  environment.variables = {
    SDL_JOYSTICK_HIDAPI = 0;
  };

  hardware.steam-hardware.enable = true;
  hardware.cpu.amd.updateMicrocode = true;
  hardware.keyboard.qmk.enable = true;

  powerManagement.cpuFreqGovernor = "performance";
}
