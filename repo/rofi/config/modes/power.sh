#!/usr/bin/env sh

if [ x"${@}" = x"lock" ]
then
    xscreensaver-command -lock
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

if [ x"${@}" = x"hlwm quit" ]
then
    herbstclient quit
    exit 0
fi
echo "lock"
echo "reboot"
echo "suspend"
echo "shutdown"
echo "hlwm quit"
