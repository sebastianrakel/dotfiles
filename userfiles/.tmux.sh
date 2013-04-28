#!/bin/bash
SESSION=main
tmux="tmux -2"

if [ -e ~/tmux.conf ]; then
	$tmux="$tmux -f ~/.tmux.conf"
fi

# if the session is already running, just attach to it.
$tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
       echo "Session $SESSION already exists. Attaching."
       sleep 1
       $tmux attach -t $SESSION
       exit 0;
fi
                                 
# create a new session, named $SESSION, and detach from it
$tmux new-session -d -s $SESSION
