let
  launch-floating-btop = "hyprctl dispatch exec '[float; center; size 80% 85%] pidof btop || kitty btop'";
in {
  spacing = 0;

  modules-left = [
    "custom/launcher"
    "hyprland/workspaces"
    "tray"
    "idle_inhibitor"
  ];
  modules-center = [
    "hyprland/window"
  ];
  modules-right = [
    "custom/notification"
    "cpu"
    "memory"
    "disk"
    "pulseaudio"
    "network"
    "clock"
    "custom/power"
  ];

  "custom/launcher" = {
    format = "󱄅";
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
      "2" = "";
      "3" = "";
      "4" = "";
    };
  };

  tray = {
    icon-size = 15;
    spacing = 10;
  };

  idle_inhibitor = {
    format = "{icon}";
    tooltip = false;
    format-icons = {
      activated = "";
      deactivated = "";
    };
  };

  "hyprland/window" = {
    rewrite = {
      "^ (.*)" = "$1";
      "(.*) $" = "$1";
      "(.*) - Discord" = "$1";
      "(.*) — Ablaze Floorp.*" = "$1";
      "^(Ablaze Floorp)$" = "New Tab";
      "(.*) - VSCodium" = "$1";
    };
    separate-outputs = true;
  };

  "custom/notification" = let
    notification-badge = "<span foreground='red'><sup></sup></span>";
  in {
    format = "{icon}";
    format-icons = {
      notification = "${notification-badge}";
      none = "";
      dnd-notification = "${notification-badge}";
      dnd-none = "";
      inhibited-notification = "${notification-badge}";
      inhibited-none = "";
      dnd-inhibited-notification = "${notification-badge}";
      dnd-inhibited-none = "";
    };
    return-type = "json";
    exec-if = "which swaync-client";
    exec = "swaync-client -swb | sed -u 's/Notification/unread notification/g'";
    on-click = "swaync-client -t -sw";
    on-click-right = "swaync-client -d -sw";
    escape = true;
  };

  cpu = {
    format = " {usage}%";
    tooltip = false;
    on-click = launch-floating-btop;
  };

  memory = {
    format = " {}%";
    on-click = launch-floating-btop;
  };

  disk = {
    format = "󱛟 {percentage_used}%";
    on-click = launch-floating-btop;
  };

  pulseaudio = {
    format = "{icon} {volume}%";
    format-bluetooth = "󰂰 {volume}%";
    format-bluetooth-muted = "<span size='large'>󰗿</span><span size='xx-small'> </span>";
    format-muted = "<span size='x-large'>󰝟</span><span size='xx-small'> </span>";
    format-icons = {
      headphone = "󰋋";
      hands-free = "";
      headset = "";
      phone = "";
      portable = "";
      car = "";
      default = ["" "" "<sub> </sub>"];
    };
    on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    on-click-right = "pavucontrol";
    on-click-middle = "easyeffects";
    ignored-sinks = [
      "Starship/Matisse HD Audio Controller Digital Stereo (IEC958)"
      "GA102 High Definition Audio Controller Digital Stereo (HDMI)"
      "Meteor condenser microphone Analog Stereo"
      "Easy Effects Sink"
    ];
  };

  network = {
    format-wifi = " <sub> </sub>{essid}";
    format-ethernet = " <sub> </sub>Wired";
    tooltip-format = " <sub> </sub>{ifname} via {gwaddr}";
    format-linked = " <sub> </sub>{ifname} (No IP)";
    format-disconnected = "⚠ Disconnected";
    format-alt = "{ifname} = {ipaddr}/{cidr}";
  };

  clock = {
    calendar = {
      format = {
        today = "<span color='#F5C2E7'><b>{}</b></span>";
      };
    };
    timezone = "America/New_York";
    format = " {:%I:%M %p}";
    tooltip-format = "<tt><small>{calendar}</small></tt>";
    format-alt = "󰸘 {:%m-%d-%Y}";
  };

  "custom/power" = {
    format = "⏻";
    tooltip = false;
    on-click = "wlogout";
  };
}
