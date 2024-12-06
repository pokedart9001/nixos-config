{
  pkgs,
  username,
  ...
}: {
  home.packages = with pkgs; [
    ## Utils
    # gamemode
    # gamescope
    winetricks
    protonup-qt
    protontricks
    # inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    # inputs.nix-gaming.packages.${pkgs.system}.wine-ge

    ## Cli games
    _2048-in-terminal
    vitetris
    nethack

    ## Celeste
    celeste-classic
    celeste-classic-pm

    ## Doom
    gzdoom
    crispy-doom

    ## Osu!
    osu-lazer-bin

    ## Emulation
    duckstation
    pcsx2

    (pkgs.stdenv.mkDerivation rec {
      pname = "sgdboop";
      version = "1.3.1";

      src = fetchFromGitHub {
        owner = "SteamGridDB";
        repo = "SGDBoop";
        tag = "v${version}";
        hash = "sha256-FpVQQo2N/qV+cFhYZ1FVm+xlPHSVMH4L+irnQEMlUQs=";
      };

      makeFlags = [
        "FLATPAK_ID=fake"
      ];

      postPatch = ''
        substituteInPlace Makefile \
              --replace-fail "/app/" "$out/"
      '';

      postInstall = ''
        rm -r "$out/share/metainfo"
      '';

      nativeBuildInputs = with pkgs; [
        pkg-config
      ];

      buildInputs = with pkgs; [
        curl
        gtk3
      ];

      meta = {
        description = "Applying custom artwork to Steam, using SteamGridDB";
        homepage = "https://github.com/SteamGridDB/SGDBoop/";
        license = lib.licenses.zlib;
        maintainers = with lib.maintainers; [
          saturn745
          fazzi
        ];
        mainProgram = "SGDBoop";
        platforms = lib.platforms.linux;
      };
    })
  ];

  slippi-launcher = {
    isoPath = "/home/${username}/ROMs/GCN/Super Smash Bros. Melee (v1.02).iso";
    launchMeleeOnPlay = true;
  };
}
