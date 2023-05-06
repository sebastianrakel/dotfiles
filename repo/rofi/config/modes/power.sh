#!/usr/bin/env sh

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
echo "reboot"
echo "suspend"
echo "shutdown"
echo "hlwm quit"

   
