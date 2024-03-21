#!/usr/bin/env sh

if [ x"${@}" = x"lock" ]
then
    if [ "${XDG_CURRENT_DESKTOP}" = "Hyprland" ]; then
        swaylock -f -c 000000
    else
	xscreensaver-command -lock > /dev/null &
    fi
    exit 0
fi

if [ x"${@}" = x"reboot" ]
then
    systemctl reboot
    exit 0
fi

if [ x"${@}" = x"suspend" ]
then
    systemctl suspend
    exit 0
fi

if [ x"${@}" = x"shutdown" ]
then
    systemctl poweroff
    exit 0
fi

if [ x"${@}" = x"wm quit" ]
then
    if [ "${XDG_CURRENT_DESKTOP}" = "Hyprland" ]; then
	hyprctl dispatch exit
	exit 0
    else
	herbstclient quit
	exit 0
    fi

    exit 1
fi
echo "lock"
echo "reboot"
echo "suspend"
echo "shutdown"
echo "wm quit"
