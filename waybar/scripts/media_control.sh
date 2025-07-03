#!/usr/bin/env bash

ICON_BACK="􀊎"
ICON_PLAY="􀊈"
ICON_NEXT="􀊐"
ICON_SHUFFLE="􀊝"
ICON_REPEAT="􀊞"

STATUS=$(playerctl status 2>/dev/null)

if [[ "$STATUS" == "Playing" ]]; then
  ICON="$ICON_PLAY"
elif [[ "$STATUS" == "Paused" ]]; then
  ICON="$ICON_PLAY"
else
  ICON="⏹"
fi

TITLE=$(playerctl metadata title 2>/dev/null)
ARTIST=$(playerctl metadata artist 2>/dev/null)

if [[ -n "$TITLE" && -n "$ARTIST" ]]; then
  echo "$ICON $TITLE - $ARTIST"
elif [[ "$STATUS" == "Stopped" ]]; then
  echo "⏹ Stopped"
else
  echo "$ICON"
fi
