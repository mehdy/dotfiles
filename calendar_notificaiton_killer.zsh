#!/usr/bin/env zsh

dbus-monitor "interface='org.freedesktop.Notifications'" | while read -r line; do
	if [[ $line == *"calendar.google.com"* ]]; then
		sleep 10 && dunstctl close
	fi
done
