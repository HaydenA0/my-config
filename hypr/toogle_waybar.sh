#!/usr/bin/env bash

# Check if Waybar is running
if pgrep -x "waybar" > /dev/null; then
    # If running, kill it
    pkill -x waybar
else
    # If not running, start it in the background
    waybar &
fi

