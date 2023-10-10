#!/usr/bin/env bash

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
