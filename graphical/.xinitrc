#!/bin/sh

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

real_wm_start_command=${wm_start_command:-"herbstluftwm --locked"}
exec "${real_wm_start_command}"
