#!/usr/bin/env bash

theme_name="${1}"

rm "${HOME}/.config/herbstluftwm/active_theme.sh"
ln -s "${HOME}/.config/herbstluftwm/themes/${theme_name}.sh" "${HOME}/.config/herbstluftwm/active_theme.sh"

echo "Reloading hlwm"
herbstclient reload
