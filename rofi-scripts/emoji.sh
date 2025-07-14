#!/usr/bin/env bash

# Path to emoji list
emoji_file="$HOME/.config/rofi/emoji-list.txt"

# Make sure the file exists
if [[ ! -f "$emoji_file" ]]; then
  notify-send "Emoji list not found"
  exit 1
fi

# Use Rofi to choose emoji
chosen=$(rofi -dmenu -i -theme ~/.config/rofi/themes/emoji.rasi -p " Emoji" <"$emoji_file")

# Extract the emoji (first word of line)
emoji=$(echo "$chosen" | awk '{print $1}')

# Copy to clipboard
if command -v wl-copy &>/dev/null; then
  echo -n "$emoji" | wl-copy
elif command -v xclip &>/dev/null; then
  echo -n "$emoji" | xclip -selection clipboard
elif command -v xsel &>/dev/null; then
  echo -n "$emoji" | xsel --clipboard --input
else
  notify-send "No clipboard tool found"
  exit 1
fi

# Optional notify
notify-send "Copied Emoji" "$emoji"
