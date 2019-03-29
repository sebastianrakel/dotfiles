#!/bin/bash

notify_group="volume-control"
active_sink=$(pacmd list-sinks |awk '/* index:/{print $3}')

function get_volume() {
    current_volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $1 + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
}

function set_volume {
    pactl set-sink-mute ${active_sink} false; pactl set-sink-volume ${active_sink} ${1}
    get_volume ${active_sink}
    notify-send -c "${notify_group}" "Set Volume to ${current_volume}"
}

function toggle_mute() {
    pactl set-sink-mute ${active_sink} toggle
    muted=$(pactl list sinks | grep '^[[:space:]]Mute:' | head -n $(( $1 + 1 )) | tail -n 1 | sed -e 's,.* \([A-Za-z]*\).*,\1,')
    notify-send -c "${notify_group}" "Muted ${muted}"
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
        toggle_mute ${active_sink}
    ;;
esac


