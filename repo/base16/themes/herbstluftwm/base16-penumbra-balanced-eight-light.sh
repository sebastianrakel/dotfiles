#!/usr/bin/env sh

# penumbra balanced eight light

hlwm_base00='#FFF7ED'
hlwm_base01='#F2E6D4'
hlwm_base02='#BEBEBE'
hlwm_base03='#8F8F8F'
hlwm_base04='#636363'
hlwm_base05='#3E4044'
hlwm_base06='#303338'
hlwm_base07='#24272B'
hlwm_base08='#CA736C'
hlwm_base09='#8D9741'
hlwm_base0A='#BA823A'
hlwm_base0B='#47A477'
hlwm_base0C='#00A2AF'
hlwm_base0D='#5794D0'
hlwm_base0E='#9481CC'
hlwm_base0F='#BC73A4'

herbstclient chain , \
	, attr theme.color                        "${hlwm_base07}" \
	, attr theme.background_color             "${hlwm_base00}" \
	, attr theme.normal.color                 "${hlwm_base01}" \
	, attr theme.active.color                 "${hlwm_base08}" \
	, attr theme.active.background_color      "${hlwm_base00}" \
	, attr theme.urgent.color                 "${hlwm_base0A}" \
	, attr theme.floating.active.color        "${hlwm_base08}" \
	, attr theme.floating.urgent.color        "${hlwm_base0A}" \
	, attr theme.floating.background_color    "${hlwm_base00}" \
	, attr settings.frame_bg_normal_color     "${hlwm_base00}" \
	, attr settings.frame_bg_active_color     "${hlwm_base08}" \
	, attr settings.frame_border_normal_color "${hlwm_base00}" \
	, attr settings.frame_border_active_color "${hlwm_base08}" \
	, attr theme.title_color                  "${hlwm_base07}" \
	, attr theme.active.title_color		  "${hlwm_base07}"
