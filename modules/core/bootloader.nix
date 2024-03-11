{pkgs, ...}: {
    boot = {
        loader = {
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot";
            };

            systemd-boot.enable = false;

            grub = {
                enable = true;

                devices = ["nodev"];
                efiSupport = true;
                useOSProber = true;
                configurationLimit = 10;
                splashImage = null;
            };

            timeout = 0;
        };

        plymouth = {
            enable = true;
            theme = "spin";
            themePackages = with pkgs; [
                (adi1090x-plymouth-themes.override {
                    selected_themes = ["spin"];
                })
            ];
        };

        consoleLogLevel = 0;

        initrd = {
            verbose = false;

            systemd = {
                enable = true;
                dbus.enable = true;
            };
        };

        kernelPackages = pkgs.linuxPackages;

        kernelParams = [
            "quiet"
            "splash"
            "boot.shell_on_fail"
            "loglevel=3"
            "rd.systemd.show_status=false"
            "rd.udev.log_level=3"
            "udev.log_priority=3"
            "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
        ];
    };
}
