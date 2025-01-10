#!/bin/zsh
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && dunstify -h string:x-dunst-stack-tag:settings -h int:value:$volume -i /usr/share/icons/Tela-circle-dark/16/panel/volume-level-high.svg -t 800 -r 2593 "Volume: $volume %" 
# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
