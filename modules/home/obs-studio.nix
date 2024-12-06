{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    catppuccin.enable = true;

    plugins = [
      pkgs.obs-studio-plugins.obs-pipewire-audio-capture
    ];
  };
}
