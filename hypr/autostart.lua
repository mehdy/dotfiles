-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- Session daemons (waybar, hypridle, cliphist, ...) are systemd user services; see install.sh.

local app = require("programs").app

hl.on("hyprland.start", function()
    -- Keep clipboard contents after the source app closes
    hl.exec_cmd(app .. "wl-clip-persist --clipboard regular")

    hl.exec_cmd(app .. "$HOME/.local/bin/calendar_notificaiton_killer.zsh")
end)
