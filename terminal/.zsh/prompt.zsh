autoload -U colors && colors

autoload -U promptinit
autoload -Uz vcs_info

promptinit

zstyle ':vcs_info:*' enable hg git bzr svn

is_my_project=""
precmd() {
    vcs_info
}
zstyle ':vcs_info:git*' formats "%{$fg[red]%}${is_my_project}%{$reset_color%}  %{$fg[red]%}%b%{$reset_color%} %m%u%c "
zstyle ':vcs_info:*' check-for-changes true

setopt prompt_subst
PROMPT="%{$fg[green]%}%n%{$reset_color%} at %m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
RPROMPT='${vcs_info_msg_0_}'
