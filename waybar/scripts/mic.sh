#!/usr/bin/env bash

ICON_MIC="󰍬"
ICON_MUTED="󰍭"

SOURCE_NAME=$(pactl get-default-source)
MUTE_STATE=$(pactl get-source-mute "$SOURCE_NAME" | awk '{print $2}')
SHORT_NAME=$(echo "$SOURCE_NAME" | sed 's/alsa_input\.//' | sed 's/_/-/g')

# If clicked
if [[ "$1" == "click" ]]; then
  pactl set-source-mute "$SOURCE_NAME" toggle
  exit 0
fi

# Display output
if [[ "$MUTE_STATE" == "yes" ]]; then
  echo "$ICON_MUTED "
else
  echo "$ICON_MIC $SHORT_NAME"
fi
