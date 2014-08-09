#git submodules
at first usage, you have to load the submodules

```
git submodule init && git submodule update
```

#Usage
```
usage: init.py [-h] [--graphical] [--terminal] [--editor] [--print]
               [--verbose] [--check]

init script for dotfiles

optional arguments:
  -h, --help   show this help message and exit
  --check      check if link allready set

category:
  --graphical  graphical dotfiles like i3 config
  --terminal   terminal dotfiles like zsh
  --editor     editor dotfiles like vim

output:
  --print      only print link command
  --verbose    show output
```
