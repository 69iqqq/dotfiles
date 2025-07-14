#!/usr/bin/env bash

## Screenshot Menu - Bottom Center Rofi UI using ~/.config/themes/themes.rasi

theme="$HOME/.config/rofi/themes/screenshot.rasi"
prompt='Screenshot'
mesg="DIR: $(xdg-user-dir PICTURES)/Screenshots"

# Layout: 2 options in a row
list_col=2
list_row=1
win_width='700px'

# Screenshot directory and timestamp
shot_dir="${HOME}/Pictures/Screenshots"
mkdir -p "$shot_dir"
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Options
opt1="󰍹 "
opt2=" "

rofi_cmd() {
  rofi \
    -dmenu \
    -p "$prompt" \
    -markup-rows \
    -theme "$theme"
}

run_rofi() {
  echo -e "$opt1\n$opt2" | rofi_cmd
}

take_screenshot() {
  mode="$1"
  tmpfile="/tmp/ss_edit_$timestamp.png"
  savefile="$shot_dir/screenshot_$timestamp.png"

  geometry=$(slurp)
  [[ -z "$geometry" ]] && {
    notify-send " Cancelled" "No region selected"
    return
  }

  grim -g "$geometry" "$tmpfile" &&
    cp "$tmpfile" "$savefile" || {
    notify-send " Screenshot Failed" "Grim could not save image"
    return
  }

  # Copy image to clipboard
  wl-copy <"$tmpfile"

  # Send notification with action
  action=$(
    notify-send \
      --app-name="Screenshot" \
      --icon="$tmpfile" \
      --wait \
      --action=accept="  Edit" \
      "$mode Screenshot Saved" \
      "Copied to clipboard and saved to $savefile"
  )

  [[ "$action" == "accept" ]] && swappy -f "$tmpfile"
}

chosen="$(run_rofi)"
case "$chosen" in
"$opt1") take_screenshot "Window" ;;
"$opt2") take_screenshot "Area" ;;
*) ;;
esac
