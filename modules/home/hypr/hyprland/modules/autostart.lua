-- luacheck: ignore hl

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprlock")

    hl.exec_cmd("waypaper --restore")
    hl.exec_cmd("blueman-applet")

    hl.exec_cmd("kitty -d /home/nlevitt/nixos-config/ nvim")

    hl.exec_cmd("vesktop", { workspace = "2 silent" })
    hl.exec_cmd("zen-beta", { workspace = "3 silent" })
    hl.exec_cmd("steam", { workspace = "4 silent" })

    hl.exec_cmd("1password --silent")
end)
