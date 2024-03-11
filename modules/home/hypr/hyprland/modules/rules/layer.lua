-- luacheck: ignore hl

hl.layer_rule({
    name         = "SwayNC Control Center",
    match        = { namespace = "swaync-control-center" },

    animation    = "slide right",
    dim_around   = true,
    blur         = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name         = "SwayNC Notification Window",
    match        = { namespace = "swaync-notification-window" },

    animation    = "slide right",
    blur         = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({ match = { namespace = "rofi" }, animation = "popin", dim_around = true })
hl.layer_rule({ match = { namespace = "hyprpicker" }, no_anim = true, dim_around = true })
hl.layer_rule({ match = { namespace = "wshowkeys" }, no_anim = true })
hl.layer_rule({ match = { namespace = "quickshell" }, no_anim = true })
