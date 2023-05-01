#!/usr/bin/env sh

# penumbra contrast+ eight dark

hlwm_base00='#24272B'
hlwm_base01='#3E4044'
hlwm_base02='#636363'
hlwm_base03='#9E9E9E'
hlwm_base04='#CECECE'
hlwm_base05='#F2E6D4'
hlwm_base06='#FFF7ED'
hlwm_base07='#FFFDFB'
hlwm_base08='#DF7F78'
hlwm_base09='#9CA748'
hlwm_base0A='#CE9042'
hlwm_base0B='#50B584'
hlwm_base0C='#00B3C2'
hlwm_base0D='#61A3E6'
hlwm_base0E='#A48FE1'
hlwm_base0F='#D080B6'

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
