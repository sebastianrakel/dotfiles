#!/usr/bin/env sh

# Mocha

hlwm_base00='#3B3228'
hlwm_base01='#534636'
hlwm_base02='#645240'
hlwm_base03='#7e705a'
hlwm_base04='#b8afad'
hlwm_base05='#d0c8c6'
hlwm_base06='#e9e1dd'
hlwm_base07='#f5eeeb'
hlwm_base08='#cb6077'
hlwm_base09='#d28b71'
hlwm_base0A='#f4bc87'
hlwm_base0B='#beb55b'
hlwm_base0C='#7bbda4'
hlwm_base0D='#8ab3b5'
hlwm_base0E='#a89bb9'
hlwm_base0F='#bb9584'

herbstclient chain , \
	, attr theme.color                        "${hlwm_base07}" \
	, attr theme.background_color             "${hlwm_base00}" \
	, attr theme.normal.color                 "${hlwm_base01}" \
	, attr theme.active.color                 "${hlwm_base03}" \
	, attr theme.active.background_color      "${hlwm_base00}" \
	, attr theme.urgent.color                 "${hlwm_base08}" \
	, attr theme.floating.active.color        "${hlwm_base03}" \
	, attr theme.floating.urgent.color        "${hlwm_base08}" \
	, attr theme.floating.background_color    "${hlwm_base00}" \
	, attr settings.frame_bg_normal_color     "${hlwm_base00}" \
	, attr settings.frame_bg_active_color     "${hlwm_base03}" \
	, attr settings.frame_border_normal_color "${hlwm_base00}" \
	, attr settings.frame_border_active_color "${hlwm_base03}" \
	, attr theme.title_color                  "${hlwm_base07}" \
	, attr theme.active.title_color		  "${hlwm_base05}"
