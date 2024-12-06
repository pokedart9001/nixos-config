{
  pkgs,
  username,
  system,
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
    (osu-lazer-bin.override {
      appimageTools =
        appimageTools
        // {
          wrapType2 = args:
            appimageTools.wrapType2 (args
              // rec {
                version = "latest";
                src = fetchurl {
                  url = "https://github.com/ppy/osu/releases/${version}/download/osu.AppImage";
                  hash = "sha256-348B6gtYLRTGlyCNsWiOrqg98bF/cPIsPBroisApzfc=";
                };
              });
        };
    })

    ## Emulation
    duckstation
    pcsx2
  ];

  slippi-launcher = {
    isoPath = "/home/${username}/ROMs/GCN/Super Smash Bros. Melee (v1.02).iso";
    launchMeleeOnPlay = true;
  };
}
