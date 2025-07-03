#!/usr/bin/env bash

CACHE_FILE="/tmp/yay_updates"
CACHE_TTL=1800 # 30 minutes (in seconds)
ICON="􀐛"

# Debug: log what is happening
log() {
  echo "[DEBUG] $*" >&2
}

# Manual override to refresh
if [[ "$1" == "--force" ]]; then
  log "Force-refreshing cache"
  rm -f "$CACHE_FILE"
fi

# Refresh cache if missing or expired
if [[ ! -f "$CACHE_FILE" || $(($(date +%s) - $(stat -c %Y "$CACHE_FILE"))) -gt $CACHE_TTL ]]; then
  log "Cache expired or missing. Updating..."
  updates=$(yay -Qu 2>/dev/null | grep -v "^::" | wc -l)

  # If yay failed or returned empty, fallback to 0
  if [[ -z "$updates" || ! "$updates" =~ ^[0-9]+$ ]]; then
    log "yay failed or returned invalid data. Setting updates to 0."
    updates=0
  fi

  echo "$updates" >"$CACHE_FILE"
else
  log "Using cached result"
fi

# Output final result
updates=$(<"$CACHE_FILE")
echo "$ICON $updates"
