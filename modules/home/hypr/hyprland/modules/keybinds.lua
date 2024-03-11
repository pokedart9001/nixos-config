-- luacheck: ignore hl

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

local floatCenter       = { float = true, center = true, size = "(monitor_w*0.6) (monitor_h*0.65)" }
local floatCenterLarge  = { float = true, center = true, size = "(monitor_w*0.8) (monitor_h*0.85)" }
local floatCenterNoSize = { float = true, center = true }

-- Open terminal window
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))

-- Open nixos-config in code editor
hl.bind(mainMod .. " + CTRL + Return", hl.dsp.exec_cmd("kitty -d /home/nlevitt/nixos-config nvim"))

-- Manage window and compositor properties
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("qs ipc call toggle powerMenu"))
-- hl.bind(mainMod .. " + SHIFT + escape", hl.dsp.exec_cmd("hyprshutdown --vt 2"))

-- Reload daemons
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("systemctl --user restart quickshell"))
-- hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("systemctl --user restart waybar"))
-- hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd("swaync-client -R"))

-- Script to extract mp3 audio from mkv recording
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("extract-audio"))

-- Open apps in floating mode
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd("kitty", floatCenter))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("nemo", floatCenter))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("kitty btop", floatCenterLarge))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("qalculate-gtk", floatCenterNoSize))

-- Open layered apps
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("qs ipc call toggle launcher"))
-- hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("launcher"))
-- hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("runner"))

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("qs ipc call toggle notificationCenter"))
-- hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))

-- Manage floating windows
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + CTRL + C", hl.dsp.window.center())
hl.bind(mainMod .. " + CTRL + P", hl.dsp.window.pin())

-- Manage grouped windows
hl.bind(mainMod .. " + CTRL + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + ALT + up", hl.dsp.group.next())
hl.bind(mainMod .. " + ALT + down", hl.dsp.group.prev())

-- Toggle fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Move focus with mainMod + arrow keys
-- Move windows with mainMod + SHIFT + arrow keys
for direction, movement in pairs({ left = "l", right = "r", up = "u", down = "d" }) do
    hl.bind(mainMod .. " + " .. direction, hl.dsp.focus({ direction = movement }))
    hl.bind(mainMod .. " + SHIFT + " .. direction, hl.dsp.window.move({ direction = movement }))
end

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Switch to next/previous workspace with mainMod + ALT + arrow keys
-- Move active window to the next/previous workspace with mainMod + SHIFT + ALT + arrow keys
for direction, movement in pairs({ left = "-1", right = "+1" }) do
    hl.bind(mainMod .. " + ALT + " .. direction, hl.dsp.focus({ workspace = movement }))
    hl.bind(mainMod .. " + SHIFT + ALT + " .. direction, hl.dsp.window.move({ workspace = movement }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

local screenshotsFolder = "~/Pictures/screenshots/"
-- Capture + save screenshots with (SHIFT/ALT +) Print
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -z -m active -m output -o " .. screenshotsFolder))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -z -m region -o " .. screenshotsFolder))
hl.bind("ALT + Print", hl.dsp.exec_cmd("hyprshot -z -m active -m window -o " .. screenshotsFolder))
hl.bind("ALT + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -z -m window -o " .. screenshotsFolder))

-- Capture + copy screenshots with CTRL + (SHIFT/ALT +) Print
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -z -m active -m output --clipboard-only"))
hl.bind("CTRL + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -z -m region --clipboard-only"))
hl.bind("CTRL + ALT + Print", hl.dsp.exec_cmd("hyprshot -z -m active -m window --clipboard-only"))
hl.bind("CTRL + ALT + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -z -m window --clipboard-only"))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
