-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- Laptop sits to the left of the external monitor, bottom edges aligned.
-- Positions are in logical pixels: the laptop is 1440x960 (2880x1920 at
-- scale 2) and the externals are 4K at scale 1 (2160 tall), so the laptop
-- starts at y = 2160 - 960 = 1200. Update these if a monitor or scale changes.
hl.monitor({ output = "eDP-1", mode = "highres", position = "0x1200", scale = "auto" }) -- Lenovo P14s
-- Every external monitor
hl.monitor({ output = "", mode = "highres", position = "1440x0", scale = 1 })
