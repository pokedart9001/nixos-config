-- luacheck: ignore hl

hl.config({
    decoration = {
        rounding         = 10,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        blur             = {
            size = 1,
            passes = 4,
            ignore_opacity = true,

            contrast = 2,
            brightness = 0.85,
            vibrancy = 1,
            vibrancy_darkness = 1,
        },

        shadow           = {
            enabled = false,
        },
    },
})
