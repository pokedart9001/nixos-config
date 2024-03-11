{
    pkgs,
    inputs,
    system,
    ...
}: {
    # imports = [ inputs.nix-gaming.nixosModules.default ];
    nix = {
        settings = {
            auto-optimise-store = true;
            experimental-features = ["nix-command" "flakes"];
            extra-experimental-features = ["pipe-operators"];

            substituters = [
                "https://nix-gaming.cachix.org"
                "https://hyprland.cachix.org"
            ];

            trusted-public-keys = [
                "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
                "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
            ];
        };
    };

    nixpkgs = {
        inherit system;
        config.allowUnfree = true;

        overlays = [
            inputs.nur.overlays.default
            inputs.grim-hyprland.overlays.default
            inputs.nil.overlays.default
        ];
    };

    environment.systemPackages = with pkgs; [
        wget
    ];

    systemd.user.services = {
        polkit-gnome-authentication-agent-1 = {
            description = "polkit-gnome-authentication-agent-1";
            wantedBy = ["graphical-session.target"];
            wants = ["graphical-session.target"];
            after = ["graphical-session.target"];
            serviceConfig = {
                Type = "simple";
                ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
                Restart = "on-failure";
                RestartSec = 1;
                TimeoutStopSec = 10;
            };
        };
    };

    # system.autoUpgrade = {
    #     enable = true;
    #     flake = inputs.self.outPath;
    #
    #     flags = [
    #         "--update-input"
    #         "nixpkgs"
    #         "-L" # print build logs
    #     ];
    #
    #     dates = "02:00";
    #     randomizedDelaySec = "45min";
    # };

    time = {
        timeZone = "America/New_York";
        hardwareClockInLocalTime = true;
    };

    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings.LC_TIME = "en_US.UTF-8";
    };

    system.stateVersion = "23.11";
}
