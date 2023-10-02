if [ ! -d "${HOME}/.emacs.d/personal/" ]; then
    mkdir -p "${HOME}/.emacs.d/personal/"
fi

echo "Theme: Emacs set"
echo "(defvar current-theme '${theme_name})" > "${HOME}/.emacs.d/personal/theme.el"

emacsclient -e "(switch-theme '${theme_name})"
