#!/bin/sh
# dunst's context menu (dmenu setting) with the same rofi theme as the launcher.
# A wrapper because dunst doesn't expand env vars or quotes in the dmenu command.
exec rofi -theme "$ROFI_THEME_DIR/$ROFI_THEME_STYLE.rasi" -dmenu -p dunst "$@"
