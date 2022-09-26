#!/usr/bin/env bash

theme_name="${1}"

rm "${HOME}/.config/polybar/colors"
ln -s "${HOME}/.config/polybar/themes/${theme_name}" "${HOME}/.config/polybar/colors"
