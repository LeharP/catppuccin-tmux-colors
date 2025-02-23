#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @catppuccin-tmux_theme)"

case $SELECTED_THEME in
"latte")
  declare -A THEME=(
    ["base"]="#eff1f5"
    ["overlay2"]="#7c7f93"
    ["text"]="#4c4f69"
    ["blue"]="#1e66f5"
    ["sky"]="#04a5e5"
    ["green"]="#40a02b"
    ["pink"]="#ea76cb"
    ["rosewater"]="#dc8a78"
    ["lavender"]="#7287fd"
    ["red"]="#d20f39"
    ["subtext1"]="#5c5f77"
    ["surface2"]="#acb0be"
    ["surface0"]="#ccd0da"
    ["yellow"]="#df8e1d"
  )
  ;;

"frappe")
  declare -A THEME=(
    ["base"]="#303446"
    ["overlay2"]="#949cbb"
    ["text"]="#c6d0f5"
    ["blue"]="#8caaee"
    ["sky"]="#99d1db"
    ["green"]="#a6d189"
    ["pink"]="#f4b8e4"
    ["rosewater"]="#f2d5cf"
    ["lavender"]="#babbf1"
    ["red"]="#e78284"
    ["subtext1"]="#b5bfe2"
    ["surface2"]="#626880"
    ["surface0"]="#414559"
    ["yellow"]="#e5c890"
      )
  ;;


"macchiato")
  declare -A THEME=(
    ["base"]="#24273a"
    ["overlay2"]="#939ab7"
    ["text"]="#cad3f5"
    ["blue"]="#8aadf4"
    ["sky"]="#91d7e3"
    ["green"]="#a6da95"
    ["pink"]="#f5bde6"
    ["rosewater"]="#f4dbd6"
    ["lavender"]="#b7bdf8"
    ["red"]="#ed8796"
    ["subtext1"]="#b8c0e0"
    ["surface2"]="#5b6078"
    ["surface0"]="#363a4f"
    ["yellow"]="#eed49f"
  )
  ;;

*)
  # Default to mocha theme
  declare -A THEME=(
    ["base"]="#1e1e2e"
    ["overlay2"]="#9399b2"
    ["text"]="#cdd6f4"
    ["blue"]="#89b4fa"
    ["sky"]="#89dceb"
    ["green"]="#a6e3a1"
    ["pink"]="#f5c2e7"
    ["rosewater"]="#f5e0dc"
    ["lavender"]="#bd93f9"
    ["red"]="#f38ba8"
    ["subtext1"]="#11111b"
    ["surface2"]="#585b70"
    ["surface0"]="#313244"
    ["yellow"]="#f9e2af"

  )
  ;;
esac

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
