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
 
    tmux bind-key -T panes_as_tabs_full 0 select-pane -t .0 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full 1 select-pane -t .1 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full 2 select-pane -t .2 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full 3 select-pane -t .3 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full 4 select-pane -t .4 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full 5 select-pane -t .5 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full 6 select-pane -t .6 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full 7 select-pane -t .7 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full 8 select-pane -t .8 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full 9 select-pane -t .9 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full '-' select-pane -t .10'\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full q select-pane -t .11 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full w select-pane -t .12 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full e select-pane -t .13 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full r select-pane -t .14 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full t select-pane -t .15 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full y select-pane -t .16 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full u select-pane -t .17 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full i select-pane -t .18 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full o select-pane -t .19 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full p select-pane -t .20 '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full , select-pane -t.-1  '\;' resize-pane -Z
    tmux bind-key -T panes_as_tabs_full . select-pane -t.+1 '\;' resize-pane -Z
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

main() {
    set_bindings
    set_options
}
main
