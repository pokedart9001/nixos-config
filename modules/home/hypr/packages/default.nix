{pkgs, ...}: {
    home.packages = with pkgs; [
        hyprpicker
        hyprpwcenter
        hyprshutdown

        (hyprshot.overrideAttrs {
            patches = [./hyprshot_direct_activewindow.patch];
        })

        swww
        waypaper
        wl-clipboard
    ];
}
