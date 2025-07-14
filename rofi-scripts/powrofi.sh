#!/usr/bin/env bash

# Icon + label options
options=" Poweroff
 Reboot
 Suspend
 Lock
 Logout"

# Show Rofi menu
choice=$(echo -e "$options" | rofi -dmenu -theme ~/.config/rofi/themes/powermenu.rasi -p "Touch the grass" -i)

# Perform action based on selection
case "$choice" in
" Poweroff") poweroff ;;
" Reboot") reboot ;;
" Suspend") systemctl suspend ;;
" Lock") hyprctl dispatch dpms off ;; # or swaylock/i3lock
" Logout") hyprctl dispatch exit ;;
esac
