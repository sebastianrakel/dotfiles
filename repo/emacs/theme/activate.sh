echo "Theme: Emacs set"
echo "(defvar current-theme '${theme_name})" >> "${HOME}/.emacs.d/personal/theme.el"

emacsclient -e "(switch-theme '${theme_name})"
