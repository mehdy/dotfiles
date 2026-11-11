#!/bin/sh
# Waybar module: dunst Do Not Disturb state + count of notifications held back.
# Refreshed every few seconds, and instantly via `pkill -RTMIN+9 waybar`.
waiting=$(dunstctl count waiting)
if [ "$(dunstctl is-paused)" = "true" ]; then
    text="󰂛"
    [ "$waiting" -gt 0 ] && text="$text $waiting"
    printf '{"text":"%s","class":"paused","tooltip":"Do Not Disturb on: %s waiting"}\n' "$text" "$waiting"
else
    printf '{"text":"󰂚","class":"active","tooltip":"Notifications on"}\n'
fi
