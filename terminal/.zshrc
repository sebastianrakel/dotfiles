export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i


# check dotfiles version
# dotfiles/checkStatus.sh ~/dotfiles/

source ~/.profile

if hash fzf 2>/dev/null; then    
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi
