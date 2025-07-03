#!/usr/bin/env bash

# Simple ASCII bar graph using CPU usage
HISTORY_FILE="/tmp/cpu_hist"
MAX_BARS=30

# Get current CPU usage
CPU=$(top -bn1 | grep "%Cpu" | awk '{print 100 - $8}') # 100 - idle

# Round it and cap at 100
CPU=${CPU%.*}
CPU=$((CPU > 100 ? 100 : CPU))

# Save current usage to history
if [[ ! -f "$HISTORY_FILE" ]]; then
  echo "$CPU" >"$HISTORY_FILE"
else
  echo "$CPU" >>"$HISTORY_FILE"
  tail -n $MAX_BARS "$HISTORY_FILE" >"$HISTORY_FILE.tmp"
  mv "$HISTORY_FILE.tmp" "$HISTORY_FILE"
fi

# Build bar graph
BARS=""
while read -r val; do
  case $((val / 10)) in
  0) BARS+="▁" ;;
  1) BARS+="▂" ;;
  2) BARS+="▃" ;;
  3) BARS+="▄" ;;
  4) BARS+="▅" ;;
  5) BARS+="▆" ;;
  6 | 7 | 8 | 9 | 10) BARS+="▇" ;;
  esac
done <"$HISTORY_FILE"

echo " $BARS"
