export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

# check dotfiles version
# dotfiles/checkStatus.sh ~/dotfiles/

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=setting'

if hash ruby 2>/dev/null; then
    PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"
fi

PATH=$PATH:~/go/bin
export GOPATH=~/go

if [ -z "$TMUX" ]; then
    export TERM=xterm-256color
fi
