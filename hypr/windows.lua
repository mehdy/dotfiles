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
hl.window_rule({ match = { class = "slack" },                workspace = "4 silent" })

hl.workspace_rule({ workspace = "1", default = true, monitor = "eDP-1" })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })
-- Workspaces q-r (6-9) live on whichever external monitor is connected (any
-- workstation), falling back to the laptop screen when none is. Rules are
-- re-created whenever a monitor comes or goes, and existing workspaces moved.
local LAPTOP = "eDP-1"
local qwer = { { id = "6", name = "q" }, { id = "7", name = "w" }, { id = "8", name = "e" }, { id = "9", name = "r" } }
local qwerRules = {}

local function assignQwer()
    local target = LAPTOP
    for _, m in ipairs(hl.get_monitors()) do
        if m.name ~= LAPTOP then
            target = m.name
            break
        end
    end

    for _, rule in ipairs(qwerRules) do rule:set_enabled(false) end
    qwerRules = {}
    for _, w in ipairs(qwer) do
        table.insert(qwerRules, hl.workspace_rule({ workspace = w.id, default_name = w.name, persistent = true, monitor = target }))
        local ws = hl.get_workspace(w.id)
        if ws and ws.monitor and ws.monitor.name ~= target then
            hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = target }))
        end
    end
end

assignQwer()
hl.on("monitor.added", assignQwer)
hl.on("monitor.removed", assignQwer)

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
