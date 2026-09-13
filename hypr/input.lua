-- https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
    input = {
        kb_layout  = "se, ir",
        kb_variant = "us, pes_keypad",
        -- kb_layout  = "se, ir, iq",
        -- kb_variant = "us, pes_keypad, ku_ara",
        kb_model   = "",
        kb_options = "grp:caps_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity   = 0, -- -1.0 - 1.0, 0 means no modification.
        scroll_factor = 1,

        touchpad = {
            natural_scroll       = true,
            tap_button_map       = "lmr",
            tap_and_drag         = false,
            clickfinger_behavior = true,
        },
    },
})

-- https://wiki.hypr.land/Configuring/Basics/Binds/Gestures/
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
