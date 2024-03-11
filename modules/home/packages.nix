{pkgs, ...}: {
    home.packages = with pkgs; [
        ani-cli # cli tool for scraping and watching anime
        aria2 # download manager
        bottles
        eza # ls replacement
        entr # perform action when file change
        file # Show file information
        furnace # multi-system chiptune tracker
        gimp3-with-plugins
        jdk17 # java
        libreoffice
        nemo-with-extensions # file manager
        nix-prefetch-github
        parsec-bin
        pipx # Install Python applications in isolated environments
        prismlauncher # minecraft launcher
        qbittorrent
        quickemu
        ripgrep # grep replacement
        soundwireserver # pass audio to android phone
        toipe # typing test in the terminal
        via
        yt-dlp
        ytfzf # cli tool for scraping and watching youtube
        zenity
        zoom-us

        # Programming
        gcc
        gnumake
        nodejs
        black
        cargo
        rustc
        clippy
        rustfmt
        typst
        typstyle

        alejandra
        bleachbit # cache cleaner
        cifs-utils
        cmatrix
        dust # disk space
        exfat
        fd
        gnome-disk-utility # partition manager
        ffmpeg
        imv # image viewer
        inetutils
        jq
        libnotify
        man-pages # extra man pages
        mpv # video player
        nixd # nix lsp
        ntfs3g
        openssl
        pamixer # pulseaudio command line mixer
        parallel
        pavucontrol # pulseaudio volume controle (GUI)
        pciutils
        playerctl # controller for media players
        plocate
        qalculate-gtk # calculator
        tldr
        unzip
        wget
        xdg-utils
    ];
}
