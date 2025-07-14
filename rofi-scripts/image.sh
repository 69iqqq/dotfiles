##!/usr/bin/env bash
#
## Wallpaper directory
#wall_dir="$HOME/wallpaper"
#
## Rofi selection with preview icons
#selected=$(cd "$wall_dir" && for img in *.jpg *.png *.jpeg *.webp; do
#  echo -en "$img\0icon\x1f$wall_dir/$img\n"
#done | rofi -dmenu -p "󰉏 " -theme ~/.config/rofi/themes/wallpaper.rasi)
#
## Exit if nothing selected
#[ -z "$selected" ] && exit
#
## Set wallpaper using feh / swww / hyprctl
## Uncomment your preferred method:
#
## feh --bg-fill "$wall_dir/$selected"
#swww img "$wall_dir/$selected" --transition-type any
## hyprctl hyprpaper preload "$wall_dir/$selected" && hyprctl hyprpaper wallpaper "eDP-1,$wall_dir/$selected"

#!/usr/bin/env bash

wall_dir="$HOME/wallpaper"

selected=$(cd "$wall_dir" && for img in *.jpg *.jpeg *.png *.webp; do
  # Fallback preview path
  preview_img="$wall_dir/$img"

  # Convert webp to png temporarily for icon preview
  if [[ "$img" == *.webp ]]; then
    tmp="/tmp/${img%.webp}.png"
    [ -f "$tmp" ] || convert "$preview_img" "$tmp"
    preview_img="$tmp"
  fi

  echo -en "$img\0icon\x1f$preview_img\n"
done | rofi -dmenu -p "󰉏 " -theme ~/.config/rofi/themes/wallpaper.rasi)

[ -z "$selected" ] && exit

swww img "$wall_dir/$selected" --transition-type any
