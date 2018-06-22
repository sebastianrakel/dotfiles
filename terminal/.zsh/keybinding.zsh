bindkey -e

bindkey "\e[3~"         delete-char

#Home
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line

#End
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line

#ctrl + cursor binding
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^X^E" edit-command-line
