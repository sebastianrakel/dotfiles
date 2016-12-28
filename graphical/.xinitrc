#!/bin/sh

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

#exec subtle
# exec subtle &> $HOME/subtle-$(date +"%F-%H-%M").log
# exec openbox-session
# exec i3
exec herbstluftwm --locked
# exec i3
