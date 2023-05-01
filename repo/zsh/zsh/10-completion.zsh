autoload -Uz compinit
compinit

setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*:*:*:*:*' menu select

if hash fzf 2>/dev/null; then
    sourcing=('/usr/share/fzf/completion.zsh' '/usr/share/fzf/key-bindings.zsh')
    for source in $sourcing[@]; do
    	if [[ -e "${source}" ]]; then
		source "${source}"
	fi
    done
fi
