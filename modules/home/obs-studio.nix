{pkgs, ...}: {
    programs.obs-studio = {
        enable = true;
        package = pkgs.obs-studio.override {
            cudaSupport = true;
        };

        plugins = with pkgs.obs-studio-plugins; [
            obs-pipewire-audio-capture
        ];
    };
}
