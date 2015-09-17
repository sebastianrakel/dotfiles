# git submodules
at first usage, you have to load the submodules

```
git submodule init && git submodule update
```

# Usage
```
usage: init.py [-h] [--graphical] [--terminal] [--editor] [--tools] [--fonts]
               [--bin] [--jetbrains] [--print] [--verbose] [--check] [--test]
               [--createdir]

init script for dotfiles

optional arguments:
  -h, --help   show this help message and exit
  --check      check if link allready set
  --test       only test
  --createdir  creates parent directories if not exists

category:
  --graphical  graphical dotfiles like i3 config
  --terminal   terminal dotfiles like zsh
  --editor     editor dotfiles like vim
  --tools      configfiles for tools like ssh
  --fonts      fonts for user
  --bin        binaries/scripts
  --jetbrains  jetbrains ide settings

output:
  --print      only print link command
  --verbose    show output
```
