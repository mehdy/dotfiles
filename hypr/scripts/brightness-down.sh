#!/bin/zsh
current=$((100*`brightnessctl get`/`brightnessctl max`))
brightnessctl set 5%- && dunstify -h string:x-dunst-stack-tag:settings -h int:value:$current -i /usr/share/icons/Tela-circle-dark/16/panel/gpm-brightness-lcd.svg -t 1000 -r 5555 "Brightness: $current %" 
