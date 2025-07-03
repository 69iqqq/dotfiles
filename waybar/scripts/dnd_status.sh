#!/bin/bash

# Output DND icon based on current DND status
if swaync-client -g | grep -q '"dnd":true'; then
  echo "  ᴅɴᴅ" # DND ON icon with subscript-style text
else
  echo "" # Normal notification icon
fi
