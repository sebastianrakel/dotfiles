#!/bin/sh

[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

#exec subtle
# exec subtle &> $HOME/subtle-$(date +"%F-%H-%M").log
exec startxfce4
