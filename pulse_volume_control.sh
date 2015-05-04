#!/bin/bash

COMMAND="$1"

DEFAULT_SINK=`pactl info | awk -F ': ' '$1 == "Default Sink" {print $2; exit}'`
CURRENT_SINK=`pactl list sinks short | awk -F '\t' '$2 == "'${DEFAULT_SINK}'" {print $1; exit}'` 

case $COMMAND in
    lower)
        pactl set-sink-volume $CURRENT_SINK -5%
        ;;
    raise)
        pactl set-sink-volume $CURRENT_SINK +5%
        ;;
    mute)
        pactl set-sink-mute $CURRENT_SINK toggle
        ;;
esac


