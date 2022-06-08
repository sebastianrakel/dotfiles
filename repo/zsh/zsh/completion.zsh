unsetopt menu_complete
unsetopt flowcontrol

setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


zstyle ':completion:*:*:*:*:*' menu select

# complete ssh hostnames
[[ -r ~/.ssh/known_hosts ]] && _ssh_hosts=(${${${${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}%%:*}#\[}%\]}) || _ssh_hosts=()
[[ -r ~/.ssh/config ]] && _ssh_config_hosts=($(sed -rn 's/host\s+(.+)/\1/ip' "$HOME/.ssh/config" | grep -v "\*" )) || _ssh_config_hosts=()
hosts=(
        $HOST
        "$_ssh_hosts[@]"
        $_ssh_config_hosts[@]
        localhost
    )
zstyle ':completion:*:hosts' hosts $hosts

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zshcache

