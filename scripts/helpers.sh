#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

set_tmux_hook() {
    local trigger=$1
    local index=$2
    tmux set-hook -g "${1}"\["${2}"\]" \"${3}\""
}

set_tmux_runshell_command() {
    echo "run-shell $1 $2 $3 $4 $5"
}


get_panes_as_tabs_prefix() { 
    get_tmux_option "${panes_as_tabs_prefix_option}" "${panes_as_tabs_prefix_default}"
}

get_panes_as_tabs_fullscreen() { 
    get_tmux_option "${panes_as_tabs_fullscreen_option}" "${panes_as_tabs_fullscreen_default}"
}

toggle_panes_as_tabs_fullscreen() { 
    echo "BANG!!"
    if [ $(get_pane_as_tabs_fullscreen) == 'full' ]; then
        set_tmux_option "${panes_as_tabs_fullscreen_option}" "nofull"
    elif [ $(get_pane_as_tabs_fullscreen) == 'nofull' ]; then
        set_tmux_option "${panes_as_tabs_fullscreen_option}" "full"
    else
        display 'Pane as tabs Unknown error!!'
    fi
}


set_tmux_hook_sync_active_pane() {
    local sync_source
    local sync_destiny
    sync_source=$(get_sync_source)
    sync_destiny=$(get_sync_destiny)
    local fullpath_command="${SCRIPT_DIR}/sync_active_pane.sh"
    local run_shell_command
    run_shell_command="run-shell \"${fullpath_command} -s ${sync_source} -t ${sync_destiny}\""
    tmux set-hook -g "after-select-pane[1]" "$run_shell_command"
}
set_tmux_hook_zoom_synced_pane() {
    local sync_destiny=$(get_sync_destiny)
    tmux set-hook -g after-select-pane[0] "resize-pane -Z -t ${sync_destiny}"
}

set_tmux_runshell_sync_active_pane() {
    local sync_source=$(get_sync_source)
    local sync_destiny=$(get_sync_destiny)
    local fullpath_command="${CURRENT_DIR}/sync_active_pane.sh"
    local run_shell_command=$(set_tmux_runshell_command "${fullpath_command}" "-s " "${sync_source}" "-t " "${sync_destiny}")
    echo $run_shell_command;
}

get_pane_sync_on() {
    get_tmux_option "${pane_sync_on_option}" "${pane_sync_on_default}"
}
set_pane_sync_on() {
    set_tmux_option "${pane_sync_on_option}" "${pane_sync_on_default}"
}

get_sync_source() {
    get_tmux_option "${sync_source_option}" "${sync_source_default}"
}
set_sync_source() {
    set_tmux_option "${sync_source_option}" "${sync_source_default}"
}


get_sync_destiny() {
    get_tmux_option "${sync_destiny_option}" "${sync_destiny_default}"
}
set_sync_destiny() {
    set_tmux_option "${sync_destiny_option}" "${sync_destiny_default}"
}

