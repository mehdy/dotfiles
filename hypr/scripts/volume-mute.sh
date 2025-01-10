#!/bin/zsh
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
icon=/usr/share/icons/Tela-circle-dark/16/panel/volume-level-muted.svg
if wpctl get-volume @DEFAULT_AUDIO_SINK@ | rg -q MUTED; then
	icon=/usr/share/icons/Tela-circle-dark/16/panel/volume-level-high.svg
fi
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && dunstify -h string:x-dunst-stack-tag:settings -h int:value:$volume -i $icon -t 800 -r 2593 "Volume: $volume %" 
# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
