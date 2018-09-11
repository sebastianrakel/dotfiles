#!/bin/sh
#----------------------------------------------------
# Author:       Florian "Bluewind" Pritz <flo@xssn.at>
#
# Licensed under WTFPL v2
#   (see COPYING for full license text)
#
#----------------------------------------------------
# make working with the agent easier and prevent
# starting multiple agents
#----------------------------------------------------
initgpg(){
	[ -z $XDG_CONFIG_HOME ] && XDG_CONFIG_HOME="$HOME/.config"
	[ -f "$XDG_CONFIG_HOME/disable-gpg-agent" ] && return 0
	#if [[ ! -S "$HOME/.gnupg/S.gpg-agent.ssh" ]]; then
	if ! pgrep -u ${SUDO_USER:-$USER} -x gpg-agent >/dev/null; then
		#pkill gpg-agent
	        gpg-agent --daemon --enable-ssh-support >/dev/null
	fi
	# export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
	export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh
}

if [ -n $DISPLAY ]; then
	initgpg
fi
