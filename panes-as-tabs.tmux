#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux run-shell "$CURRENT_DIR/scripts/helpers.sh"
#source "$CURRENT_DIR/scripts/helpers.sh"

#tmux display-message "panes-as-tabs executed"


# tmux bind-key -r o select-pane -t .+1 \; resize-pane -Z
# tmux bind-key -r i select-pane -t .-1 \; resize-pane -Z
# tmux bind-key -r < command-prompt -p "rename pane to:" "select-pane -T '%%'"
# tmux set-option -g status-format[1] "#[align=centre]#{P:#{?pane_active,#[reverse],}#{pane_index}[#{pane_title}]#[default] }"
# tmux bind-key -n M-z switch-client -T panes
# tmux bind-key -T panes 0 select-pane -t .0 \; resize-pane -Z
# tmux bind-key -T panes 1 select-pane -t .1 \; resize-pane -Z
# tmux bind-key -T panes 2 select-pane -t .2 \; resize-pane -Z
# tmux bind-key -T panes 3 select-pane -t .3 \; resize-pane -Z
# tmux bind-key -T panes 4 select-pane -t .4 \; resize-pane -Z
# tmux bind-key -T panes 5 select-pane -t .5 \; resize-pane -Z
# tmux bind-key -T panes 6 select-pane -t .6 \; resize-pane -Z
# tmux bind-key -T panes 7 select-pane -t .7 \; resize-pane -Z
# tmux bind-key -T panes 8 select-pane -t .8 \; resize-pane -Z
# tmux bind-key -T panes 9 select-pane -t .9 \; resize-pane -Z
# tmux bind-key -T panes - switch-client -Tpanesb
# tmux bind-key -T panesb 0 select-pane -t .10 \; resize-pane -Z
# tmux bind-key -T panesb 1 select-pane -t .11 \; resize-pane -Z
# tmux bind-key -T panesb 2 select-pane -t .12 \; resize-pane -Z
# tmux bind-key -T panesb 3 select-pane -t .13 \; resize-pane -Z
# tmux bind-key -T panesb 4 select-pane -t .14 \; resize-pane -Z
# tmux bind-key -T panesb 5 select-pane -t .15 \; resize-pane -Z
# tmux bind-key -T panesb 6 select-pane -t .16 \; resize-pane -Z
# tmux bind-key -T panesb 7 select-pane -t .17 \; resize-pane -Z
# tmux bind-key -T panesb 8 select-pane -t .18 \; resize-pane -Z
# tmux bind-key -T panesb 9 select-pane -t .19 \; resize-pane -Z


#make the status bar grow 1 more line
#customize the status bar to show the pane title
#rename pane as
#select the <panes-prefix-fullscreen>
#select the <panes-prefix-splitted>
