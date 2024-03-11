-- luacheck: ignore hl

local colors = require("themes.catppuccin")

hl.config({
    group = {
        col = {
            border_active = colors.mauve,
            border_inactive = colors.blue
        },

        groupbar = {
            font_family = "Inter",
            text_color = colors.text,

            col = {
                active = "rgba(" .. colors.mauveAlpha .. "99" .. ")",
                inactive = "rgba(" .. colors.blueAlpha .. "99" .. ")",
            },

            gaps_in = 3,
            gaps_out = 3
        }
    }
})
