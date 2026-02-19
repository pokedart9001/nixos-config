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
        citron-emu
        (pkgs.appimageTools.wrapType2 rec {
            pname = "duckstation";
            version = "latest";

            src = fetchurl {
                url = "https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage";
                hash = "sha256-drCzRzlMuJ1DpqhBPknZYnRuOoTANl99jSvguqcD3EU=";
            };

            appimageContents = appimageTools.extract {inherit pname version src;};

            extraInstallCommands = ''
                mkdir -p $out/share/{applications,icons/hicolor/512x512/apps}

                cp ${appimageContents}/org.duckstation.DuckStation.desktop $out/share/applications/
                cp ${appimageContents}/org.duckstation.DuckStation.png $out/share/icons/hicolor/512x512/apps/

                substituteInPlace $out/share/applications/org.duckstation.DuckStation.desktop --replace-fail 'TryExec=duckstation-qt' 'TryExec=duckstation'
                substituteInPlace $out/share/applications/org.duckstation.DuckStation.desktop --replace-fail 'Exec=duckstation-qt %f' 'Exec=duckstation'
                substituteInPlace $out/share/applications/org.duckstation.DuckStation.desktop --replace-fail 'Categories=Game;Emulator;Qt;' 'Categories=Game;Emulator;'
            '';
        })

        ## SteamGridDB
        sgdboop
    ];
}
