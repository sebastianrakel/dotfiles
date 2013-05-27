# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sebastian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

PROMPT="%{$fg[green]%}%n%{$reset_color%} at %m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
