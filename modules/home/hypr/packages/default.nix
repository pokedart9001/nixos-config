{
    inputs,
    pkgs,
    system,
    ...
}: {
    home.packages = with pkgs; [
        hyprpicker
        hyprpwcenter
        hyprshutdown
        hyprland-qt-support

        inputs.hyprqt6engine.packages.${system}.default

        (hyprshot.overrideAttrs {
            patches = [./hyprshot_direct_activewindow.patch];
        })

        swww
        waypaper
        wl-clipboard
    ];
}
