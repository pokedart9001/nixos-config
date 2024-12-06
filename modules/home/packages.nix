{pkgs, ...}: {
  home.packages = with pkgs; [
    ani-cli # cli tool for scraping and watching anime
    aria2 # download manager
    bottles
    eza # ls replacement
    entr # perform action when file change
    file # Show file information
    furnace # multi-system chiptune tracker
    gimp
    jdk17 # java
    libreoffice
    nemo-with-extensions # file manager
    nix-prefetch-github
    pipx # Install Python applications in isolated environments
    prismlauncher # minecraft launcher
    qbittorrent
    ripgrep # grep replacement
    soundwireserver # pass audio to android phone
    toipe # typing test in the terminal
    ventoy
    via
    yt-dlp
    ytfzf # cli tool for scraping and watching youtube
    zenity

    # Programming
    gcc
    gnumake
    nodejs
    rustup

    alejandra
    bleachbit # cache cleaner
    cifs-utils
    cmatrix
    dust # disk space
    # escrotum # X11 cli screenshot utility
    exfat
    gnome-disk-utility # partition manager
    ffmpeg
    flyctl
    imv # image viewer
    inetutils
    jq
    libnotify
    man-pages # extra man pages
    mpv # video player
    # nitrogen # X11 wallpaper manager
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
    # snixembed # X11 systray icon manager
    tldr
    unzip
    wget
    # xclip # X11 clipboard
    # xcolor # X11 color picker
    xdg-utils
    # xdotool # X11 input simulator
  ];
}
