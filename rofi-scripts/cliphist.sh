#!/usr/bin/env bash
# File: ~/bin/rofi-cliphist
# Usage: rofi-cliphist

# Theme path
ROFI_THEME="$HOME/.config/rofi/themes/cliphist.rasi"

# Get entries with line numbers
entries=$(cliphist list | awk '{$1=""; print substr($0,2)}')
entries_with_clear=$(echo -e "${entries}\n󰩹  Clear History")

# Launch rofi
selection=$(echo -e "$entries_with_clear" | rofi -dmenu -theme "$ROFI_THEME" -p "󱘞 ")

# Exit if nothing selected
[[ -z "$selection" ]] && exit 0

# Handle Clear History
if [[ "$selection" == "󰩹  Clear History" ]]; then
  cliphist wipe
  notify-send "Clipboard history cleared"
  exit 0
fi

# Find selected item’s ID by matching text
entry_id=$(cliphist list | grep -F "$selection" | head -n1 | cut -f1)

# If an ID is found, decode and copy
if [[ -n "$entry_id" ]]; then
  cliphist decode "$entry_id" | wl-copy --type text/plain
fi
