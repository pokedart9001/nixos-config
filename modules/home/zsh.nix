{
    config,
    lib,
    ...
}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        dotDir = "${config.xdg.configHome}/zsh";
        history.path = "${config.xdg.stateHome}/zsh/history";

        oh-my-zsh = {
            enable = true;
            plugins = ["git" "fzf"];
        };
        initContent = lib.mkBefore ''
            DISABLE_MAGIC_FUNCTIONS=true
            export "MICRO_TRUECOLOR=1"
        '';
        shellAliases = {
            # Utils
            c = "clear";
            cd = "z";

            cat = "bat";
            nano = "micro";
            icat = "kitten icat";
            dsize = "du -hs";
            findw = "grep -rl";

            ls = "eza --icons --group-directories-first -1"; #EZA_ICON_SPACING=2
            ll = "eza --icons --group-directories-first -1 --no-user --long";
            tree = "eza --icons --tree --group-directories-first";

            edit = "kitty --detach nvim";

            # Nixos
            cdnix = "cd ~/nixos-config";
            nix-edit = "kitty --detach -d ~/nixos-config nvim";
            nix-flake-update = "sudo nix flake update --flake ~/nixos-config#";

            # Git
            ga = "git add";
            gaa = "git add --all";
            gs = "git status";
            gb = "git branch";
            gm = "git merge";
            gpl = "git pull";
            gplo = "git pull origin";
            gps = "git push";
            gpst = "git push --follow-tags";
            gpso = "git push origin";
            gc = "git commit";
            gcm = "git commit -m";
            gr = "git restore";
            grs = "git restore --staged";
            gch = "git checkout";
            gchb = "git checkout -b";
            gcoe = "git config user.email";
            gcon = "git config user.name";

            # Python
            piv = "python -m venv .venv";
            psv = "source .venv/bin/activate";
        };
    };

    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };
}
