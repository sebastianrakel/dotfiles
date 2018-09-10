#!/bin/bash

function get_volume {
    current_volume=`pactl list sinks | grep '^[[:space:]]Volume:' | head -n 1 | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`
}

function set_volume {
    pactl set-sink-mute 0 false; pactl set-sink-volume 0 $1
    get_volume
    notify-send "Set Volume to ${current_volume}"
}

function get_mute_state {
    mute_output=`pactl list sinks | grep '^[[:space:]]Mute:' | head -n 1 | tail -n 1 | sed -e 's,.* \([A-Za-z]*\).*,\1,'`

    if [ "${mute_output}" == "yes"]; then
        mute_state="muted"
    else
        mute_state="unmuted"
    fi
}

case "${1}"
in
    "increase")
        set_volume "+5%"
    ;;
    "decrease")
        set_volume "-5%"
    ;;
    "mute")
        pactl set-sink-mute 0 toggle
        get_mute_state
        notify-send "Volume is ${mute_state}"
    ;;
esac


