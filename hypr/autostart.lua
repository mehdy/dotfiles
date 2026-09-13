-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    hl.exec_cmd([[gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"]])      -- for GTK3 apps
    hl.exec_cmd([[gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"]])   -- for GTK4 apps

    hl.exec_cmd("$HOME/.local/bin/calendar_notificaiton_killer.zsh")
end)
