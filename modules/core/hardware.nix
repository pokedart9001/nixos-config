{pkgs, ...}: {
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

            nvidiaPersistenced = true;
        };

        bluetooth = {
            enable = true;
            powerOnBoot = true;
        };

        enableRedistributableFirmware = true;

        xpadneo.enable = true;

        steam-hardware.enable = true;
        cpu.amd.updateMicrocode = true;
        keyboard.qmk.enable = true;
    };

    environment.variables = {
        SDL_JOYSTICK_HIDAPI = 0;
        GSK_RENDERER = "gl";
    };

    powerManagement.cpuFreqGovernor = "performance";
}
