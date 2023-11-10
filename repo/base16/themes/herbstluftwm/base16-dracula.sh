#!/usr/bin/env sh

# Dracula

hlwm_base00='#282936'
hlwm_base01='#3a3c4e'
hlwm_base02='#4d4f68'
hlwm_base03='#626483'
hlwm_base04='#62d6e8'
hlwm_base05='#e9e9f4'
hlwm_base06='#f1f2f8'
hlwm_base07='#f7f7fb'
hlwm_base08='#ea51b2'
hlwm_base09='#b45bcf'
hlwm_base0A='#00f769'
hlwm_base0B='#ebff87'
hlwm_base0C='#a1efe4'
hlwm_base0D='#62d6e8'
hlwm_base0E='#b45bcf'
hlwm_base0F='#00f769'

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
