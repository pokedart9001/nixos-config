{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = false;
    };

    programs.gamemode.enable = true;
    programs.gamescope.enable = true;

    environment.variables = {
        STEAM_DISABLE_BROWSER_SHUTDOWN_WORKAROUND = "1";
    };
}
