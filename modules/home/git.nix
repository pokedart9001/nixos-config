{pkgs, ...}: {
    programs.git = {
        enable = true;

        settings = {
            user = {
                name = "pokedart9001";
                email = "noahhlevitt@gmail.com";
            };

            alias = {
                revise = "commit -a --amend --no-edit";
                compress = "!git rebase --autosquash --root; git push -f";
            };

            init.defaultBranch = "main";
            credential.helper = "store";
            safe.directory = "~/nixos-config";
        };
    };

    home.packages = with pkgs; [gh lazygit];
}
