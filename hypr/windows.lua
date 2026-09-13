-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/ for workspace rules

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({ match = { class = "spotify" },              workspace = "5 silent" })
hl.window_rule({ match = { class = "org.telegram.desktop" }, workspace = "5 silent" })
hl.window_rule({ match = { class = "Slack" },                workspace = "4 silent" })

hl.workspace_rule({ workspace = "1", default = true, monitor = "eDP-1" })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "6", default_name = "q", persistent = true, monitor = "DP-1" })
hl.workspace_rule({ workspace = "7", default_name = "w", persistent = true, monitor = "DP-1" })
hl.workspace_rule({ workspace = "8", default_name = "e", persistent = true, monitor = "DP-1" })
hl.workspace_rule({ workspace = "9", default_name = "r", persistent = true, monitor = "DP-1" })
