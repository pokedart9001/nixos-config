{pkgs, ...}: {
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

        ## Doom
        gzdoom
        crispy-doom

        ## Osu!
        osu-lazer-bin

        ## Emulation
        retroarch-free
        mgba

        ## SteamGridDB
        sgdboop
    ];
}
