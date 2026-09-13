-- Programs used across the config.
-- Required by keybindings.lua; returns a table since each require() is its own Lua scope.

local chrome  = "google-chrome-stable"
local firefox = "firefox"
local menu    = "rofi -theme $ROFI_THEME_DIR/$ROFI_THEME_STYLE.rasi" -- -show needs to be added

return {
    terminal    = "alacritty",
    chrome      = chrome,
    firefox     = firefox,
    browser     = chrome,
    fileManager = "nautilus",
    menu        = menu,
    clipboard   = menu
        .. " -modi clipboard:/usr/bin/cliphist-rofi-img -show clipboard -show icons"
        .. " -display-columns 2 -calc-command 'wl-copy {result}'",
}
