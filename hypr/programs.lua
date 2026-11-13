-- Programs used across the config.
-- Required by keybindings.lua; returns a table since each require() is its own Lua scope.

-- Launch apps in their own systemd scope under uwsm
local app = "uwsm app -- "

local chrome  = app .. "google-chrome-stable"
local firefox = app .. "firefox"
-- -show needs to be added; -run-command makes apps launched from rofi go through uwsm too.
-- The theme comes from ~/.config/rofi/config.rasi.
local menu    = "rofi -run-command '" .. app .. "{cmd}'"

return {
    app         = app,
    terminal    = app .. "alacritty",
    chrome      = chrome,
    firefox     = firefox,
    browser     = chrome,
    fileManager = app .. "nautilus",
    menu        = menu,
    clipboard   = menu
        .. " -modi clipboard:$HOME/.config/rofi/cliphist-rofi-img -show clipboard -show-icons"
        .. " -display-columns 2",
}
