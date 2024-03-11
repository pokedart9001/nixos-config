{pkgs, ...}: {
    boot = {
        loader = {
            efi.canTouchEfiVariables = true;
            efi.efiSysMountPoint = "/boot";

            systemd-boot.enable = false;

            grub = {
                enable = true;

                devices = ["nodev"];
                efiSupport = true;
                useOSProber = true;
                configurationLimit = 10;

                font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/NerdFonts/JetBrainsMonoNerdFont-Regular.ttf";
                fontSize = 48;
                splashImage = null;
            };

            timeout = 0;
        };

        plymouth = {
            enable = true;
            theme = "breeze";
        };

        consoleLogLevel = 0;
        initrd.verbose = false;

        kernelParams = [
            "quiet"
            "splash"
            "boot.shell_on_fail"
            "loglevel=3"
            "rd.systemd.show_status=false"
            "rd.udev.log_level=3"
            "udev.log_priority=3"
        ];

        kernelPackages = pkgs.linuxPackages_zen;

        initrd.systemd = {
            enable = true;
            dbus.enable = true;
        };
    };
}
