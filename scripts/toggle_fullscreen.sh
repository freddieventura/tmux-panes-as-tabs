#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"
source "$CURRENT_DIR/variables.sh"

if [ $(get_panes_as_tabs_fullscreen) == 'full' ]; then
    set_tmux_option "${panes_as_tabs_fullscreen_option}" "nofull"
    tmux bind-key -T root "$(get_panes_as_tabs_prefix)" switch-client -T panes_as_tabs_$(get_panes_as_tabs_fullscreen)
    tmux resize-pane -Z
elif [ $(get_panes_as_tabs_fullscreen) == 'nofull' ]; then
    set_tmux_option "${panes_as_tabs_fullscreen_option}" "full"
    tmux bind-key -T root "$(get_panes_as_tabs_prefix)" switch-client -T panes_as_tabs_$(get_panes_as_tabs_fullscreen)
    tmux resize-pane -Z
else
    echo 'Pane as tabs Unknown error!!'
fi

