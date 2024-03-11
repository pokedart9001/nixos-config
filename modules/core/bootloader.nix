{pkgs, ...}: {
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

            font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/NerdFonts/JetBrainsMonoNerdFont-Regular.ttf";
            fontSize = 48;
            splashImage = null;
        };

        timeout = 0;
    };

    boot.plymouth = {
        enable = true;
        theme = "breeze";
    };

    boot.consoleLogLevel = 0;
    boot.initrd.verbose = false;
    boot.kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
    ];

    boot.kernelPackages = pkgs.linuxPackages_zen;

    boot.initrd.systemd = {
        enable = true;
        dbus.enable = true;
    };
}
