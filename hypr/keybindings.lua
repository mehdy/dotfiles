-- See https://wiki.hypr.land/Configuring/Basics/Binds/ for more

local p = require("programs")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Programs
hl.bind(mainMod .. " + T",        hl.dsp.exec_cmd(p.terminal))
hl.bind(mainMod .. " + F",        hl.dsp.exec_cmd(p.fileManager))
hl.bind(mainMod .. " + B",        hl.dsp.exec_cmd(p.browser))
hl.bind(mainMod .. " + C",        hl.dsp.exec_cmd(p.clipboard))
hl.bind(mainMod .. " + Space",    hl.dsp.exec_cmd(p.menu .. " -show drun"))
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd(p.menu .. " -show emoji"))
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd(p.menu .. " -show calc"))

-- Behaviors
hl.bind(mainMod .. " + X", hl.dsp.window.close())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())           -- dwindle
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))     -- dwindle
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Special use of minimization
hl.bind(mainMod .. " + S", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("magic"))
    hl.dispatch(hl.dsp.window.move({ workspace = "r+0" }))
    hl.dispatch(hl.dsp.workspace.toggle_special("magic"))
    hl.dispatch(hl.dsp.window.move({ workspace = "special:magic" }))
    hl.dispatch(hl.dsp.workspace.toggle_special("magic"))
end)

-- Minimize windows
hl.bind(mainMod .. " + M", function()
    hl.dispatch(hl.dsp.window.move({ workspace = "special:magic" }))
    hl.dispatch(hl.dsp.workspace.toggle_special("magic"))
end)

-- Show minimized windows
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.workspace.toggle_special("magic"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + ALT + left",  hl.dsp.window.resize({ x = -10, y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + up",    hl.dsp.window.resize({ x = 0,   y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + down",  hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }), { repeating = true })

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.center())
hl.bind(mainMod .. " + CTRL + F",  hl.dsp.window.float())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

-- Screenshot
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(
    [[FILE=~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png; grim -g "$(slurp)" - | tee >(wl-copy) | { cat > "$FILE" && [ -s "$FILE" ] && dunstify -i "$FILE" "Screenshot of the region taken" -t 1000 || rm -f "$FILE"; }]]
))
-- screenshot of the whole screen
hl.bind("Print", hl.dsp.exec_cmd(
    [[grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify  -i ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png "Screenshot of whole screen taken" -t 1000]]
))

-- Switch workspaces with mainMod + [1-5] / [qwer]
-- Move active window to a workspace with mainMod + SHIFT + [1-5] / [qwer]
local workspaceKeys = {
    { key = "1", workspace = 1 },
    { key = "2", workspace = 2 },
    { key = "3", workspace = 3 },
    { key = "4", workspace = 4 },
    { key = "5", workspace = 5 },
    { key = "q", workspace = 6 },
    { key = "w", workspace = 7 },
    { key = "e", workspace = 8 },
    { key = "r", workspace = 9 },
}

for _, w in ipairs(workspaceKeys) do
    hl.bind(mainMod .. " + " .. w.key,           hl.dsp.focus({ workspace = w.workspace }))
    hl.bind(mainMod .. " + SHIFT + " .. w.key,   hl.dsp.window.move({ workspace = w.workspace }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Zoom in and out of windows with mainMod + mouse wheel
local function zoomBy(multiplier)
    local factor = hl.get_config("cursor.zoom_factor") * multiplier
    if factor < 1 then
        factor = 1
    end
    hl.config({ ["cursor.zoom_factor"] = factor })
end

local function zoomReset()
    hl.config({ ["cursor.zoom_factor"] = 1 })
end

hl.bind(mainMod .. " + mouse_down",         function() zoomBy(1.1) end)
hl.bind(mainMod .. " + mouse_up",           function() zoomBy(0.9) end)
hl.bind(mainMod .. " + SHIFT + mouse_up",   zoomReset)
hl.bind(mainMod .. " + SHIFT + mouse_down", zoomReset)

hl.bind(mainMod .. " + equal", function() zoomBy(1.1) end, { repeating = true })
hl.bind(mainMod .. " + minus", function() zoomBy(0.9) end, { repeating = true })
hl.bind(mainMod .. " + SHIFT + 0", zoomReset)

-- Laptop multimedia keys for volume and LCD brightness
local mediaFlags = { repeating = true, locked = true }

hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("~/.config/hypr/scripts/volume-up.sh"),         mediaFlags)
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("~/.config/hypr/scripts/volume-down.sh"),       mediaFlags)
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("~/.config/hypr/scripts/volume-mute.sh"),       mediaFlags)
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), mediaFlags)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness-up.sh"),     mediaFlags)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness-down.sh"),   mediaFlags)

hl.bind("XF86Favorites",  hl.dsp.exec_cmd("playerctl -p 'spotify,*' play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl -p 'spotify,*' play-pause"), { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl -p 'spotify,*' next"),       { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl -p 'spotify,*' previous"),   { locked = true })
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd("playerctl -p 'spotify,*' previous"),   { locked = true })
hl.bind("CTRL + ALT + D", hl.dsp.exec_cmd("playerctl -p 'spotify,*' next"),       { locked = true })
