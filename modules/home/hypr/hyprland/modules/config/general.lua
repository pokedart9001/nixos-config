-- luacheck: ignore hl

local colors = require("themes.catppuccin")

hl.config({
    general = {
        gaps_in          = 3,
        gaps_out         = 5,

        border_size      = 1,

        col              = {
            active_border   = colors.surface0,
            inactive_border = "rgba(" .. colors.surface0Alpha .. "44" .. ")",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing    = false,

        layout           = "dwindle",
    },
})
