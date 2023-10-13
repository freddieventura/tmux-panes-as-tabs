#!/usr/bin/env bash


function help() {
    echo "Synchronize the active pane of a source Session:Window to a destiny Session:Window"
    echo "USAGE: sync_active_pane.sh [-s src-window] [-t dst-window] -h"
    echo "Note that the addressing system for the window is session_index:window_index"
    echo "No need to prepend special characters to it such as @session_index"
}

source_window=""
destiny_window=""

# PARSING OPTIONS
# ---------------------------------------------------------

# Use correct variable name PASSED_ARGS (you had PASSED_AGS)
PASSED_ARGS=$@

# Check if any arguments were passed
if [[ ${#PASSED_ARGS} -ne 0 ]]; then
  while getopts ":s:t:h" ARG; do
    case "$ARG" in
      s) source_window=$OPTARG ;;
      t) destiny_window=$OPTARG ;;
      h) help
         exit 1 ;;
      \?) help
         exit 1 ;;
      :) help
         exit 1 ;;
    esac
  done
else
  help
  exit 1
fi

# Shift the processed options and arguments
shift "$((OPTIND-1))"


if [[ -z ${source_window} ]]; then
    source_window=$(tmux display -p "#{session_id}:#{window_id}")
fi

if [[ -z ${destiny_window} ]]; then
    help
    exit 1
fi

# EOF EOF PARSING OPTIONS
# ---------------------------------------------------------



# In Source determining the active pane
#active_pane=$(./get_active_pane.sh -s ${source_window})



no_panes=$(($(tmux list-panes -t \$${source_window} | wc -l) - 1))
for i in $(seq 0 ${no_panes}); do
    if [[ $(tmux display -t \$${source_window}.$i -p "#{pane_active}") == '1' ]] then
       active_pane=$i
    fi;
done



tmux select-pane -tZ \$${destiny_window}.${active_pane}


