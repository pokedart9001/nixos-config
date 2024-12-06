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
    osu-lazer-bin

    ## Emulation
    duckstation
    pcsx2
  ];

  slippi-launcher = {
    isoPath = "/home/${username}/ROMs/GCN/Super Smash Bros. Melee (v1.02).iso";
    launchMeleeOnPlay = true;
  };
}
