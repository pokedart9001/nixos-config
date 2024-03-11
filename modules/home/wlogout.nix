{
    programs.wlogout = {
        enable = true;

        layout = [
            {
                label = "lock";
                action = "loginctl lock-session";
                text = "Lock";
                keybind = "l";
            }
            {
                label = "hibernate";
                action = "systemctl hibernate";
                text = "Hibernate";
                keybind = "h";
            }
            {
                label = "logout";
                action = "loginctl terminate-user $USER";
                text = "Logout";
                keybind = "e";
            }
            {
                label = "shutdown";
                action = "hyprshutdown -t 'Shutting down...' --post-cmd 'systemctl shutdown'";
                text = "Shutdown";
                keybind = "s";
            }
            {
                label = "suspend";
                action = "systemctl suspend";
                text = "Suspend";
                keybind = "u";
            }
            {
                label = "reboot";
                action = "hyprshutdown -t 'Restarting...' --post-cmd 'systemctl reboot'";
                text = "Reboot";
                keybind = "r";
            }
        ];
    };
}
