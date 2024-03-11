{pkgs, ...}: {
    programs.rofi.enable = true;

    xdg.configFile."rofi/catppuccin-lavrent-mocha.rasi".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/hiimsergey/rofi-catppuccin/refs/heads/main/catppuccin-lavrent-mocha.rasi";
        hash = "sha256-AKATLIAIbMVFylX9xs38HCDxv0SPh7WY6ZgF9QgVTPQ=";
    };

    xdg.configFile."rofi/config.rasi".text = ''
        configuration {
            show-icons: true;
            click-to-exit: true;

            font: "Inter 10.5";

            display-ssh:         " ";
            display-run:         " ";
            display-drun:        " ";
            display-window:      " ";
            display-combi:       " ";
            display-filebrowser: " ";
        }

        @theme "~/.config/rofi/catppuccin-lavrent-mocha.rasi"

        window {
            height: 350;
            width: 500;
            border: 1;
            border-color: @surface0;
        }

        inputbar {
            padding: 8 5 1 8;
        }

        prompt {
            margin: 0;
            padding: 5 2 0 2;
            font: "SymbolsNerdFont 13";
        }

        entry {
            border: 1;
            border-radius: 10;
            border-color: @surface0;
            padding: 5 8;
            cursor: text;
        }

        element {
            cursor: pointer;
        }

        element-icon {
            size: 24;
        }
    '';
}
