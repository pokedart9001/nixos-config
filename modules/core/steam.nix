{pkgs, ...}: {
    programs = {
        steam = {
            enable = true;
            package = pkgs.millennium-steam;

            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = false;
        };

        gamemode.enable = true;
        gamescope.enable = true;
    };

    environment.variables = {
        STEAM_DISABLE_BROWSER_SHUTDOWN_WORKAROUND = "1";
    };
}
