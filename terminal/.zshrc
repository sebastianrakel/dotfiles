export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

# check dotfiles version
dotfiles/checkStatus.sh ~/dotfiles/

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=setting'
