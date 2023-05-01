hlwm_theme_path="${HOME}/.config/herbstluftwm/theme.sh"
if [[ -h "${hlwm_theme_path}" ]]; then
    rm "${hlwm_theme_path}"
fi

ln -s "${HOME}/.base-16/output/herbstluftwm/${theme_name}.sh" "${hlwm_theme_path}"
herbstclient reload
