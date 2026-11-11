#!/bin/zsh
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
state=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(awk '{print $2 * 100}' <<< "$state")
icon=/usr/share/icons/Tela-circle-dark/16/panel/volume-level-high.svg
if [[ $state == *MUTED* ]]; then
	icon=/usr/share/icons/Tela-circle-dark/16/panel/volume-level-muted.svg
fi
dunstify -h string:x-dunst-stack-tag:settings -h int:value:$volume -i $icon -t 800 -r 2593 "Volume: $volume %"
# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
