polybar_theme_path="${HOME}/.config/polybar/theme.ini"
if [[ -h "${polybar_theme_path}" ]]; then
    rm "${polybar_theme_path}"
fi

ln -s "${HOME}/.base-16/output/polybar/${theme_name}.ini" "${polybar_theme_path}"
polybar-msg cmd restart
