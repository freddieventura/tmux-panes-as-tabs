#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"
source "$CURRENT_DIR/scripts/variables.sh"

set_options() {
    tmux set-option -g status 2
    tmux set-option -g status-format[1] "#[align=centre]#{P:#{?pane_active,#[reverse],}#{pane_index}[#{pane_title}]#[default] }"
}
set_bindings() {
    tmux bind-key -T root "$(get_panes_as_tabs_prefix)" switch-client -T panes_as_tabs_$(get_panes_as_tabs_fullscreen)

    tmux bind-key -T panes_as_tabs_full f run-shell -b $CURRENT_DIR/scripts/toggle_fullscreen.sh
    tmux bind-key -T panes_as_tabs_nofull f run-shell -b $CURRENT_DIR/scripts/toggle_fullscreen.sh
 
    tmux bind-key -T panes_as_tabs_full 0 select-pane -Z -t .0 
    tmux bind-key -T panes_as_tabs_full 1 select-pane -Z -t .1 
    tmux bind-key -T panes_as_tabs_full 2 select-pane -Z -t .2 
    tmux bind-key -T panes_as_tabs_full 3 select-pane -Z -t .3 
    tmux bind-key -T panes_as_tabs_full 4 select-pane -Z -t .4 
    tmux bind-key -T panes_as_tabs_full 5 select-pane -Z -t .5 
    tmux bind-key -T panes_as_tabs_full 6 select-pane -Z -t .6 
    tmux bind-key -T panes_as_tabs_full 7 select-pane -Z -t .7 
    tmux bind-key -T panes_as_tabs_full 8 select-pane -Z -t .8 
    tmux bind-key -T panes_as_tabs_full 9 select-pane -Z -t .9 
    tmux bind-key -T panes_as_tabs_full '-' select-pane -Z -t .10
    tmux bind-key -T panes_as_tabs_full q select-pane -Z -t .11 
    tmux bind-key -T panes_as_tabs_full w select-pane -Z -t .12 
    tmux bind-key -T panes_as_tabs_full e select-pane -Z -t .13 
    tmux bind-key -T panes_as_tabs_full r select-pane -Z -t .14 
    tmux bind-key -T panes_as_tabs_full t select-pane -Z -t .15 
    tmux bind-key -T panes_as_tabs_full y select-pane -Z -t .16 
    tmux bind-key -T panes_as_tabs_full u select-pane -Z -t .17 
    tmux bind-key -T panes_as_tabs_full i select-pane -Z -t .18 
    tmux bind-key -T panes_as_tabs_full o select-pane -Z -t .19 
    tmux bind-key -T panes_as_tabs_full p select-pane -Z -t .20 
    tmux bind-key -T panes_as_tabs_full , select-pane -Z -t.-1  
    tmux bind-key -T panes_as_tabs_full . select-pane -Z -t.+1 
    tmux bind-key -T panes_as_tabs_full c command-prompt -p "rename pane to:" "select-pane -T '%%'"


    tmux bind-key -T panes_as_tabs_nofull 0 select-pane -t .0 
    tmux bind-key -T panes_as_tabs_nofull 1 select-pane -t .1
    tmux bind-key -T panes_as_tabs_nofull 2 select-pane -t .2
    tmux bind-key -T panes_as_tabs_nofull 3 select-pane -t .3
    tmux bind-key -T panes_as_tabs_nofull 4 select-pane -t .4
    tmux bind-key -T panes_as_tabs_nofull 5 select-pane -t .5
    tmux bind-key -T panes_as_tabs_nofull 6 select-pane -t .6
    tmux bind-key -T panes_as_tabs_nofull 7 select-pane -t .7
    tmux bind-key -T panes_as_tabs_nofull 8 select-pane -t .8
    tmux bind-key -T panes_as_tabs_nofull 9 select-pane -t .9
    tmux bind-key -T panes_as_tabs_nofull '-' select-pane -t .10
    tmux bind-key -T panes_as_tabs_nofull q select-pane -t .11
    tmux bind-key -T panes_as_tabs_nofull w select-pane -t .12
    tmux bind-key -T panes_as_tabs_nofull e select-pane -t .13
    tmux bind-key -T panes_as_tabs_nofull r select-pane -t .14
    tmux bind-key -T panes_as_tabs_nofull t select-pane -t .15
    tmux bind-key -T panes_as_tabs_nofull y select-pane -t .16
    tmux bind-key -T panes_as_tabs_nofull u select-pane -t .17
    tmux bind-key -T panes_as_tabs_nofull i select-pane -t .18
    tmux bind-key -T panes_as_tabs_nofull o select-pane -t .19
    tmux bind-key -T panes_as_tabs_nofull p select-pane -t .20
    tmux bind-key -T panes_as_tabs_nofull , select-pane -t.-1 
    tmux bind-key -T panes_as_tabs_nofull . select-pane -t.+1 
    tmux bind-key -T panes_as_tabs_nofull c command-prompt -p "rename pane to:" "select-pane -T '%%'"

}
set_hooks() {
    if [[ $(get_pane_sync_on)  == 'yes' ]] then
#        set_tmux_hook_zoom_synced_pane
        set_tmux_hook_sync_active_pane
#        tmux set-hook -g after-select-pane[1] "resize-pane -Z -t ${sync_destiny}"
    else
        tmux set-hook -gu after-select-pane[0]
    fi
}

main() {
    set_bindings
    set_options
    set_hooks
}
main
