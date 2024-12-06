{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    _1password-gui
    ani-cli # cli tool for scraping and watching anime
    aria2 # download manager
    bitwise # cli tool for bit / hex manipulation
    bottles
    eza # ls replacement
    entr # perform action when file change
    file # Show file information
    furnace # multi-system chiptune tracker
    jdk17 # java
    libreoffice
    nix-prefetch-github
    pipx # Install Python applications in isolated environments
    prismlauncher # minecraft launcher
    ripgrep # grep replacement
    soundwireserver # pass audio to android phone
    tgpt
    todo # cli todo list
    toipe # typing test in the terminal
    nemo-with-extensions # file manager
    yazi # terminal file manager
    ytfzf # cli tool for scraping and watching youtube
    zenity

    # C / C++
    gcc
    gnumake

    alejandra
    bleachbit # cache cleaner
    cmatrix
    diskonaut
    escrotum # cli screenshot utility
    exfat
    gnome-disk-utility # partition manager
    ffmpeg
    imv # image viewer
    jq
    libnotify
    man-pages # extra man pages
    mpv # video player
    ncdu # disk space
    nitrogen # x11 wallpaper manager
    ntfs3g
    openssl
    pamixer # pulseaudio command line mixer
    parallel
    pavucontrol # pulseaudio volume controle (GUI)
    pciutils
    playerctl # controller for media players
    plocate
    qalculate-gtk # calculator
    snixembed
    tldr
    unzip
    wget
    xclip
    xcolor
    xdg-utils
    xdotool
  ];
}
