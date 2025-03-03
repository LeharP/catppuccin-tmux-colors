#!/usr/bin/env bash
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# title      Catppuccin Tmux                                          +
# version    1.0.0                                                    +
# repository https://github.com/mark-pitblado/catppuccin-tmux         +
# author     Mark Pitblado                                            +
# email      mark@pitblado.me                                         +
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_PATH="$CURRENT_DIR/src"

source $SCRIPTS_PATH/themes.sh

tmux set -g status-left-length 80
tmux set -g status-right-length 150

RESET="#[fg=${THEME[text]},bg=${THEME[base]},nobold,noitalics,nounderscore,nodim]"
# Highlight colors
tmux set -g mode-style "fg=${THEME[lavender]},bg=${THEME[subtext1]}"

tmux set -g message-style "bg=${THEME[blue]},fg=${THEME[base]}"
tmux set -g message-command-style "fg=${THEME[text]},bg=${THEME[base]}"

tmux set -g pane-border-style "fg=${THEME[subtext1]}"
tmux set -g pane-active-border-style "fg=${THEME[blue]}"
tmux set -g pane-border-status off

tmux set -g status-style bg="${THEME[base]}"

TMUX_VARS="$(tmux show -g)"

default_window_id_style="none"
default_pane_id_style="hsquare"
default_zoom_id_style="dsquare"

window_id_style="$(echo "$TMUX_VARS" | grep '@catppuccin-tmux_window_id_style' | cut -d" " -f2)"
pane_id_style="$(echo "$TMUX_VARS" | grep '@catppuccin-tmux_pane_id_style' | cut -d" " -f2)"
zoom_id_style="$(echo "$TMUX_VARS" | grep '@catppuccin-tmux_zoom_id_style' | cut -d" " -f2)"
window_id_style="${window_id_style:-$default_window_id_style}"
pane_id_style="${pane_id_style:-$default_pane_id_style}"
zoom_id_style="${zoom_id_style:-$default_zoom_id_style}"

netspeed="#($SCRIPTS_PATH/netspeed.sh)"
cmus_status="#($SCRIPTS_PATH/music-tmux-statusbar.sh)"
git_status="#($SCRIPTS_PATH/git-status.sh #{pane_current_path})"
wb_git_status="#($SCRIPTS_PATH/wb-git-status.sh #{pane_current_path} &)"
window_number="#($SCRIPTS_PATH/custom-number.sh #I $window_id_style)"
custom_pane="#($SCRIPTS_PATH/custom-number.sh #P $pane_id_style)"
zoom_number="#($SCRIPTS_PATH/custom-number.sh #P $zoom_id_style)"
date_and_time="$($SCRIPTS_PATH/datetime-widget.sh)"
current_path="#($SCRIPTS_PATH/path-widget.sh #{pane_current_path})"
battery_status="#($SCRIPTS_PATH/battery-widget.sh)"

#+--- Bars LEFT ---+
# Session name
tmux set -g status-left "#[fg=${THEME[base]},bg=${THEME[lavender]},bold] #{?client_prefix,󰠠 ,#[dim] }#[bold,nodim]#S "

#+--- Windows ---+
# Focus
tmux set -g window-status-current-format "$RESET#[fg=${THEME[lavender]},bg=${THEME[surface0]}] #{?#{==:#{pane_current_command},ssh},󰣀 ,}#[fg=${THEME[text]},bold,nodim]$window_number#W#[nobold]#{?window_last_flag, , }"
# Unfocused
tmux set -g window-status-format "$RESET#[fg=${THEME[text]}] #{?#{==:#{pane_current_command},ssh},󰣀 ,}${RESET}$window_number#W#[nobold,dim]#[fg=${THEME[yellow]}]#{?window_last_flag, , }"

#+--- Bars RIGHT ---+
tmux set -g status-right "$battery_status$current_path$cmus_status$netspeed$wb_git_status$date_and_time"
tmux set -g window-status-separator ""
