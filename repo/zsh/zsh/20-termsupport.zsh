function title {
    [[ "$EMACS" == *term* ]] && return

    # if $2 is unset use $1 as default
    # if it is set and empty, leave it as is
    : ${2=$1}

    if [[ "$TERM" == screen* ]]; then
        print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
    elif [[ "$TERM" == xterm* ]] || [[ "$TERM" == rxvt* ]] || [[ "$TERM" == ansi ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
        print -Pn "\e]2;$2:q\a" #set window name
        print -Pn "\e]1;$1:q\a" #set icon (=tab) name
    fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

function title_precmd {
    title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

function title_preexec {
    emulate -L zsh
    setopt extended_glob

    local CMD=${1[(wr)^(*=*|sudo|ssh|rake|-*)]:gs/%/%%}
    local LINE="${2:gs/%/%%}"

    title '$CMD' '%100>...>$LINE%<<'
}

add-zsh-hook preexec title_preexec
add-zsh-hook precmd title_precmd
