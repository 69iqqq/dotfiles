#!/usr/bin/env bash

STATE_FILE="/tmp/waybar_timer_state"
DURATION=$((25 * 60)) # 25 minutes default

# Initialize state file
init_state() {
  echo "$DURATION:paused" >"$STATE_FILE"
}

read_state() {
  if [[ ! -f $STATE_FILE ]]; then
    init_state
  fi
  IFS=':' read -r TIME_LEFT STATUS <"$STATE_FILE"
}

write_state() {
  echo "$TIME_LEFT:$STATUS" >"$STATE_FILE"
}

update_time() {
  if [[ "$STATUS" == "running" ]]; then
    TIME_LEFT=$((TIME_LEFT - 1))
    if [[ $TIME_LEFT -le 0 ]]; then
      STATUS="done"
      TIME_LEFT=0
    fi
    write_state
  fi
}

format_time() {
  MIN=$((TIME_LEFT / 60))
  SEC=$((TIME_LEFT % 60))
  printf "%02d:%02d" "$MIN" "$SEC"
}

handle_click() {
  case "$1" in
  left)
    if [[ "$STATUS" == "paused" ]]; then
      STATUS="running"
    elif [[ "$STATUS" == "running" ]]; then
      STATUS="paused"
    fi
    write_state
    ;;
  right)
    TIME_LEFT=$DURATION
    STATUS="paused"
    write_state
    ;;
  up)
    TIME_LEFT=$((TIME_LEFT + 60))
    write_state
    ;;
  down)
    if [[ $TIME_LEFT -gt 60 ]]; then
      TIME_LEFT=$((TIME_LEFT - 60))
    else
      TIME_LEFT=60
    fi
    write_state
    ;;
  esac
}

# Main execution
read_state

if [[ "$1" == "click" ]]; then
  handle_click "$2"
  exit
fi

update_time

# Icon based on state
case "$STATUS" in
running) ICON=" " ;; # Stopwatch
paused) ICON=" " ;;  # Pause
done) ICON="⏰" ;;     # Alarm
*) ICON="?" ;;
esac

# Output logic:
if [[ "$STATUS" == "done" ]]; then
  echo "$ICON Done!"
elif [[ "$STATUS" == "paused" && $TIME_LEFT -eq $DURATION ]]; then
  # Not started yet
  echo " "
else
  echo "$ICON $(format_time)"
fi
