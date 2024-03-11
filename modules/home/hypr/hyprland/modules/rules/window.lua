-- luacheck: ignore hl

hl.window_rule({
    name  = "Picture-in-Picture",
    match = { class = "^(Picture-in-Picture)$" },

    float = true,
    pin   = true,
    size  = "(monitor_w/2.5) (monitor_h/2.5)"
})

hl.window_rule({
    name  = "extract-audio-ffmpeg",
    match = { class = "^(extract-audio-ffmpeg)$" },

    float = true,
    size  = "(monitor_w*0.6) (monitor_h*0.65)"
})

hl.window_rule({
    name  = "xdg-desktop-portal-gtk",
    match = { class = "^(xdg-desktop-portal-gtk)$" },

    float = true,
    size  = "(monitor_w*0.6) (monitor_h*0.65)"
})

hl.window_rule({
    name  = "Heaven Studio File Dialog",
    match = { class = "^(Heaven Studio)$", title = "^(Open|Save).*$" },

    float = true,
    size  = "(monitor_w*0.6) (monitor_h*0.65)"
})

hl.window_rule({
    name = "Steam App",
    match = { class = "^(steam_app.*)$" },

    rounding = 0,
    border_size = 0
})

hl.window_rule({ match = { class = "zenity" }, float = true })
hl.window_rule({ match = { class = "org.gnome.FileRoller" }, float = true })

hl.window_rule({ match = { class = "^(vesktop)$" }, workspace = "2 silent" })
hl.window_rule({
    match = { class = "^(zen-beta)$", title = "negative:^(Picture-in-Picture)$" },
    workspace = "3 silent"
})
hl.window_rule({ match = { class = "^(steam)$" }, workspace = "4 silent" })

-- hl.window_rule({ match = { pin = true, float = true }, border_color = "$green" } )
hl.window_rule({ match = { class = "^(nemo)$", title = "(.*)(Properties)$" }, float = true })

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
