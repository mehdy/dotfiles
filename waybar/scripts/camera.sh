#!/bin/sh
# Waybar module: show when any process has a camera (/dev/video*) open.
# waybar's privacy module has no camera type, so this fills the gap.
# Empty text hides the module.
pids=$(fuser /dev/video* 2>/dev/null | tr -s ' ' '\n' | grep -E '^[0-9]+' | tr -cd '0-9\n' | sort -u)
if [ -n "$pids" ]; then
    apps=$(ps -o comm= -p $(echo $pids | tr ' ' ',') 2>/dev/null | sort -u | paste -sd ', ')
    printf '{"text":"%s","class":"active","tooltip":"Camera in use: %s"}\n' "󰖠" "$apps"
else
    printf '{"text":"","class":"idle","tooltip":""}\n'
fi
