-- Hyprland configuration entry point.
-- See https://wiki.hypr.land/Configuring/Basics/
--
-- Each require() runs in its own Lua scope, so an error in one file does not
-- stop the others from loading.

require("monitor")
-- programs.lua is not required here: keybindings.lua pulls it in for its return value
require("autostart")
require("look-and-feel")
require("input")
require("keybindings")
require("windows")
