require("Modules.animations")
require("Modules.keybinds")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@239.76Hz",
    position = "1920x0",
    scale    = "1",
})
hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@164.92Hz",
    position = "0x0",
    scale    = "1",
})


---------------------c
---- MY PROGRAMS ----
---------------------
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"
local launcher    = "rofi -show drun -show-icons"
local StatusBar   = "waybar"
local Discord     = "discord"
local paper       = "hyprpaper"
local music       = "spotify-launcher"
-- Set programs that you use
--located in Modules/keybinds.lua
-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
 hl.on("hyprland.start", function () 
   hl.exec_cmd(StatusBar)
   hl.exec_cmd(Discord)
   hl.exec_cmd(paper)
   hl.exec_cmd(music) 
end)



-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------
-- Located in Modules/anmations.lua




-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
--hl.device({
    --name        = "epic-mouse-v1",
    --sensitivity = -0.5,
--})


---------------------
---- KEYBINDINGS ----
---------------------



--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
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

-- Forces these apps to always open on this workspace
hl.window_rule {
    name = "fix-steam-float",
    match = { class = "steam", initial_title = "Steam" },
    float = off,
    maximize = off
}



})
hl.window_rule({
    match = { class = "^(discord)$" },
    workspace = "2 silent"
})
hl.window_rule({
    match = { class = "^(steam)$" },
    workspace = "1 silent"
})
hl.window_rule({
    match = { class = "^(Spotify)$" },
    workspace = "4 silent"
})
-- Forces these workspaces to always open on this monitor
hl.workspace_rule({ 
workspace = "1", 
monitor = "DP-1", 
default = true 
})
hl.workspace_rule({ 
workspace = "3", 
monitor = "DP-1", 
default = true 
})
hl.workspace_rule({ 
workspace = "5", 
monitor = "DP-1", 
default = true 
})

hl.workspace_rule({ 
workspace = "2", 
monitor = "DP-3", 
default = true 
})
hl.workspace_rule({ 
workspace = "4", 
monitor = "DP-3", 
default = true 
})
hl.workspace_rule({ 
workspace = "6", 
monitor = "DP-3", 
default = true 
})


-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

