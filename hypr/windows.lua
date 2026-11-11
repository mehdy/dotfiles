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
hl.workspace_rule({ workspace = "6", default_name = "q", persistent = true, monitor = "desc:Dell Inc. DELL U3225QE GZTW384" })
hl.workspace_rule({ workspace = "7", default_name = "w", persistent = true, monitor = "desc:Dell Inc. DELL U3225QE GZTW384" })
hl.workspace_rule({ workspace = "8", default_name = "e", persistent = true, monitor = "desc:Dell Inc. DELL U3225QE GZTW384" })
hl.workspace_rule({ workspace = "9", default_name = "r", persistent = true, monitor = "desc:Dell Inc. DELL U3225QE GZTW384" })

-- Floating utility dialogs, centered
hl.window_rule({
    name   = "float-dialogs",
    match  = { title = "^(Open|Save|Select|Choose|Upload)( a)? ?(File|Files|Folder|As).*" },
    float  = true,
    center = true,
    size   = "monitor_w*0.5 monitor_h*0.6",
})
hl.window_rule({
    name   = "float-portal-picker",
    match  = { class = "^xdg-desktop-portal-gtk$" },
    float  = true,
    center = true,
    size   = "monitor_w*0.5 monitor_h*0.6",
})
hl.window_rule({
    name   = "float-settings-apps",
    match  = { class = "^(org\\.pulseaudio\\.pavucontrol|nm-connection-editor|\\.?blueman-manager(-wrapped)?|hyprpolkitagent)$" },
    float  = true,
    center = true,
    size   = "monitor_w*0.4 monitor_h*0.5",
})

-- Picture-in-Picture (Chrome & Firefox): floating, pinned to all workspaces, bottom-right
hl.window_rule({
    name              = "pip",
    match             = { title = "^Picture[- ]in[- ][Pp]icture$" },
    float             = true,
    pin               = true,
    keep_aspect_ratio = true,
    size              = "480 270",
    move              = "monitor_w-500 monitor_h-290",
})
