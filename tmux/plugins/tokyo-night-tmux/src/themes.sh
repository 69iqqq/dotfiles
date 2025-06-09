#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @tokyo-night-tmux_theme)"
TRANSPARENT_THEME="$(tmux show-option -gv @tokyo-night-tmux_transparent)"

case $SELECTED_THEME in
"storm")
  declare -A THEME=(
    ["background"]="#24283b"
    ["foreground"]="#a9b1d6"
    ["black"]="#414868"
    ["blue"]="#7aa2f7"
    ["cyan"]="#7dcfff"
    ["green"]="#73daca"
    ["magenta"]="#bb9af7"
    ["red"]="#f7768e"
    ["white"]="#a9b1d6"
    ["yellow"]="#e0af68"
    ["bblack"]="#414868"
    ["bblue"]="#7aa2f7"
    ["bcyan"]="#7dcfff"
    ["bgreen"]="#41a6b5"
    ["bmagenta"]="#bb9af7"
    ["bred"]="#f7768e"
    ["bwhite"]="#787c99"
    ["byellow"]="#e0af68"
  )
  ;;

"day")
  declare -A THEME=(
    ["background"]="#d5d6db"
    ["foreground"]="#343b58"
    ["black"]="#0f0f14"
    ["blue"]="#34548a"
    ["cyan"]="#0f4b6e"
    ["green"]="#33635c"
    ["magenta"]="#5a4a78"
    ["red"]="#8c4351"
    ["white"]="#343b58"
    ["yellow"]="#8f5e15"
    ["bblack"]="#9699a3"
    ["bblue"]="#34548a"
    ["bcyan"]="#0f4b6e"
    ["bgreen"]="#33635c"
    ["bmagenta"]="#5a4a78"
    ["bred"]="#8c4351"
    ["bwhite"]="#343b58"
    ["byellow"]="#8f5815"
  )
  ;;

"everforest")
  declare -A THEME=(
    ["background"]="#2b3339"
    ["foreground"]="#d3c6aa"
    ["black"]="#323c41"
    ["blue"]="#7fbbb3"
    ["cyan"]="#ddd0b4"
    ["green"]="#83c092"
    ["magenta"]="#d699b6"
    ["red"]="#e67e80"
    ["white"]="#e7dabe"
    ["yellow"]="#dbbc7f"
    ["bblack"]="#3a4248"
    ["bblue"]="#7fbbb3"
    ["bcyan"]="#ddd0b4"
    ["bgreen"]="#a7c080"
    ["bmagenta"]="#d699b6"
    ["bred"]="#e69875"
    ["bwhite"]="#d3c6aa"
    ["byellow"]="#dbbc7f"
  )
  ;;

"gruvbox")
  declare -A THEME=(
    ["background"]="#282828"
    ["foreground"]="#d5c4a1"
    ["black"]="#3c3836"
    ["blue"]="#83a598"
    ["cyan"]="#8ec07c"
    ["green"]="#b8bb26"
    ["magenta"]="#d3869b"
    ["red"]="#fb4934"
    ["white"]="#fbf1c7"
    ["yellow"]="#fabd2f"
    ["bblack"]="#423e3c"
    ["bblue"]="#83a598"
    ["bcyan"]="#8ec07c"
    ["bgreen"]="#b8bb26"
    ["bmagenta"]="#d3869b"
    ["bred"]="#fe8019"
    ["bwhite"]="#ebdbb2"
    ["byellow"]="#fabd2f"
  )
  ;;

"oxocarbon")
  declare -A THEME=(
    ["background"]="#161616"
    ["foreground"]="#f2f4f8"
    ["black"]="#262626"
    ["red"]="#ee5396"
    ["green"]="#42be65"
    ["yellow"]="#ffe97b"
    ["blue"]="#33b1ff"
    ["magenta"]="#be95ff"
    ["cyan"]="#3ddbd9"
    ["white"]="#dde1e6"
    ["bblack"]="#393939"
    ["bred"]="#fa4d56"
    ["bgreen"]="#6fdc8c"
    ["byellow"]="#f1c21b"
    ["bblue"]="#78a9ff"
    ["bmagenta"]="#d4bbff"
    ["bcyan"]="#82cfff"
    ["bwhite"]="#ffffff"
  )
  ;;

"carbonfox")
  declare -A THEME=(
    ["background"]="#161616"
    ["foreground"]="#f2f4f8"
    ["black"]="#161616"
    ["red"]="#78A9FF"
    ["green"]="#25be6a"
    ["yellow"]="#3DDBD9"
    ["blue"]="#FF7EB6"
    ["magenta"]="#BE95FF"
    ["cyan"]="#33B1FF"
    ["white"]="#f2f4f8"
    ["bblack"]="#3b3b3b"
    ["bred"]="#78A9FF"
    ["bgreen"]="#25be6a"
    ["byellow"]="#3DDBD9"
    ["bblue"]="#FF7EB6"
    ["bmagenta"]="#BE95FF"
    ["bcyan"]="#33B1FF"
    ["bwhite"]="#e0e0e0"
  )
  ;;

"rosepine")
  declare -A THEME=(
    ["background"]="#191724"
    ["foreground"]="#e0def4"
    ["black"]="#1f1d2e"
    ["red"]="#eb6f92"
    ["green"]="#31748f"
    ["yellow"]="#f6c177"
    ["blue"]="#9ccfd8"
    ["magenta"]="#c4a7e7"
    ["cyan"]="#ebbcba"
    ["white"]="#e0def4"
    ["bblack"]="#26233a"
    ["bred"]="#eb6f92"
    ["bgreen"]="#31748f"
    ["byellow"]="#f6c177"
    ["bblue"]="#9ccfd8"
    ["bmagenta"]="#c4a7e7"
    ["bcyan"]="#ebbcba"
    ["bwhite"]="#524f67"
  )
  ;;

"catppuccin")
  declare -A THEME=(
    ["background"]="#1E1D2D"
    ["foreground"]="#bfc6d4"
    ["black"]="#282737"
    ["red"]="#F38BA8"
    ["green"]="#ABE9B3"
    ["yellow"]="#FAE3B0"
    ["blue"]="#89B4FA"
    ["magenta"]="#CBA6F7"
    ["cyan"]="#89DCEB"
    ["white"]="#D9E0EE"
    ["bblack"]="#2f2e3e"
    ["bred"]="#F38BA8"
    ["bgreen"]="#ABE9B3"
    ["byellow"]="#F8BD96"
    ["bblue"]="#89B4FA"
    ["bmagenta"]="#CBA6F7"
    ["bcyan"]="#89DCEB"
    ["bwhite"]="#F38BA8"
  )
  ;;

*)
  # Default to night
  declare -A THEME=(
    ["background"]="#1A1B26"
    ["foreground"]="#a9b1d6"
    ["black"]="#414868"
    ["blue"]="#7aa2f7"
    ["cyan"]="#7dcfff"
    ["green"]="#73daca"
    ["magenta"]="#bb9af7"
    ["red"]="#f7768e"
    ["white"]="#c0caf5"
    ["yellow"]="#e0af68"
    ["bblack"]="#2A2F41"
    ["bblue"]="#7aa2f7"
    ["bcyan"]="#7dcfff"
    ["bgreen"]="#41a6b5"
    ["bmagenta"]="#bb9af7"
    ["bred"]="#ff9e64"
    ["bwhite"]="#787c99"
    ["byellow"]="#e0af68"
  )
  ;;
esac

# Transparent theme override
if [ "${TRANSPARENT_THEME}" == 1 ]; then
  THEME["background"]="default"
fi

# GitHub-style extras
THEME['ghgreen']="#3fb950"
THEME['ghmagenta']="#A371F7"
THEME['ghred']="#d73a4a"
THEME['ghyellow']="#d29922"

# Reset string for tmux
RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"

