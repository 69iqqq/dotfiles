#!/usr/bin/env bash
# ~/.config/waybar/scripts/cpu_svg_graph.sh

# Sample data — replace with real CPU usage sampling
points="0,50 20,60 40,70 60,40 80,55 100,65"

cat <<EOF
{"markup":"none",
 "text":"<svg width='50' height='20' viewBox='0 0 100 20' xmlns='http://www.w3.org/2000/svg'><polyline fill='none' stroke='#8ec07c' stroke-width='2' points='$points'/></svg>"}
EOF
