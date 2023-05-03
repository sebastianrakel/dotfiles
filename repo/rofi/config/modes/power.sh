#!/usr/bin/env sh

if [ x"${@}" = x"reboot" ]
then
    systemctl reboot
fi

if [ x"${@}" = x"suspend" ]
then
    systemctl suspend
fi

if [ x"${@}" = x"shutdown" ]
then
    systemctl poweroff
fi

if [ x"${@}" = x"hlwm quit" ]
then
    herbstclient quit
fi
echo "reboot"
echo "suspend"
echo "shutdown"
echo "hlwm quit"

   
