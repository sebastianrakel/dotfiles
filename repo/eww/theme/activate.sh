echo "Theme: eww set"
eww_theme_path="${HOME}/.config/eww/active_theme.scss"
if [[ -h "${eww_theme_path}" ]]; then
    rm "${eww_theme_path}"
fi

ln -s "${HOME}/.base16-themes/styles/${theme_name}.scss" "${eww_theme_path}"
eww reload
