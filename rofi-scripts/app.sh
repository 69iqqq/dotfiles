#!/usr/bin/env bash

# Options
options=("󰈚  Open Files" "󰈦  Save File" "󰜉  Exit")

# Show menu
choice=$(printf '%s\n' "${options[@]}" | rofi \
  -dmenu \
  -theme ~/.config/rofi/themes/walker.rasi \
  -p "󰈿 Choose Action" \
  -kb-custom-1 'Alt+1' \
  -kb-custom-2 'Alt+2' \
  -kb-custom-3 'Alt+3' \
  -format 'i')

# Handle custom keys (Alt+1 = index 0, etc.)
case "$choice" in
"custom-1") selection=0 ;;
"custom-2") selection=1 ;;
"custom-3") selection=2 ;;
[0-9]*) selection="$choice" ;; # normal enter selection
*) exit 1 ;;
esac

# Do something with the selection
case "$selection" in
0) echo "📂 Open Files" ;;
1) echo "💾 Save File" ;;
2) echo "🚪 Exit" ;;
esac
