#!/bin/bash

theme="${1}"

case "${theme}" in
    "light")
	changing_theme="gruvbox-light-medium"
	;;
    "dark")
	changing_theme="dracula"
	;;
    *)
	echo "Wrong theme, choose light/dark"
	exit 1
	;;
esac

echo "Switching to ${theme} theme"
echo "Switching emacs theme"
emacsclient -e "(switch-theme '${changing_theme})"
echo "Switching alacritty theme"
alacritty-theme-switch "${changing_theme}"
echo "Switching polybar theme"
polybar-theme-switch "${changing_theme}"
echo "Switching hlwm theme"
hlwm-theme-switch.sh "${changing_theme}"

exit 0
