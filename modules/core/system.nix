{
  self,
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
      substituters = [
        "https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
  };

  nixpkgs = {
    inherit system;
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      "dotnet-runtime-wrapped-7.0.20"
      "dotnet-runtime-7.0.20"
      "dotnet-sdk-wrapped-7.0.410"
      "dotnet-sdk-7.0.410"
    ];
    overlays = [
      inputs.nur.overlays.default
      inputs.qtile.overlays.default
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

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  time.timeZone = "America/New_York";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "23.11";
}
