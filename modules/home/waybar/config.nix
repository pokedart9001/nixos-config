let
    launch-floating-btop = "hyprctl dispatch exec '[float on; center on; size (monitor_w*0.8) (monitor_h*0.85)] pidof btop || kitty btop'";
in {
    spacing = 0;
    margin-top = 2;
    reload_style_on_change = true;

    modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        "tray"
        "idle_inhibitor"
        "custom/weather"
    ];
    modules-center = [
        "hyprland/window"
    ];
    modules-right = [
        "custom/notification"
        "cpu"
        "memory"
        "disk"
        "wireplumber"
        "network"
        "clock"
        "custom/power"
    ];

    "custom/launcher" = {
        format = "<span size='large'></span>";
        tooltip = false;
        on-click = "launcher";
        on-click-right = "waypaper --random";
        on-click-middle = "waypaper";
    };

    "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        warp-on-scroll = false;
        format = "{icon}";
        format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
        };
    };

    tray = {
        icon-size = 13;
        spacing = 10;
    };

    idle_inhibitor = {
        format = "{icon}";
        tooltip = false;
        format-icons = {
            activated = "<span size='large'></span>";
            deactivated = "<span size='large'></span>";
        };
    };

    "custom/weather" = {
        exec = "wttrbar --ampm --nerd --fahrenheit --mph --date-format %m-%d-%Y --location $(curl -s 'http://ip-api.com/json?fields=city' | jq '.city' | tr -d '\"')";
        return-type = "json";
        format = "{}°F";
        tooltip = true;
        interval = 3600;
    };

    "hyprland/window" = {
        rewrite = {
            "^ (.*)" = "$1";
            "(.*) $" = "$1";
            ".*Discord . (.*)" = "$1";
            "(.*) — Zen Browser.*" = "$1";
            "^Zen Browser$" = "New Tab";
        };
        separate-outputs = true;
    };

    "custom/notification" = {
        format = "{icon}";
        format-icons = {
            notification = "<span size='large'></span>";
            none = "<span size='large'></span>";
            dnd-notification = "<span size='large'></span>";
            dnd-none = "<span size='large'></span>";
            inhibited-notification = "<span size='large'></span>";
            inhibited-none = "<span size='large'></span>";
            dnd-inhibited-notification = "<span size='large'></span>";
            dnd-inhibited-none = "<span size='large'></span>";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb | sed -u 's/Notification/unread notification/g'";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
    };

    cpu = {
        format = " {usage}%";
        on-click = launch-floating-btop;
    };

    memory = {
        format = " {}%";
        on-click = launch-floating-btop;
    };

    disk = {
        format = " {percentage_used}%";
        on-click = launch-floating-btop;
    };

    wireplumber = {
        format = " {volume}%";
        format-muted = "";
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        on-click-right = "pwvucontrol";
        on-click-middle = "easyeffects";
        ignored-sinks = [
            "Starship/Matisse HD Audio Controller Digital Stereo (IEC958)"
            "GA102 High Definition Audio Controller Digital Stereo (HDMI)"
            "Meteor condenser microphone Analog Stereo"
            "Easy Effects Sink"
        ];
    };

    network = {
        format-wifi = " {essid}";
        format-ethernet = " Wired";
        tooltip-format = " {ifname} via {gwaddr}";
        format-linked = " {ifname} (No IP)";
        format-disconnected = " Disconnected";
        format-alt = "{ifname} = {ipaddr}/{cidr}";
    };

    clock = {
        calendar = {
            format = {
                today = "<span color='#F5C2E7'><b>{}</b></span>";
            };
        };
        timezone = "America/New_York";
        format = " {:%I:%M %p}";
        tooltip-format = "<tt>{calendar}</tt>";
        format-alt = " {:%m-%d-%Y}";
    };

    "custom/power" = {
        format = "<span size='large'>⏻</span>";
        tooltip = false;
        on-click = "wlogout";
    };
}
