#!/usr/bin/env sh

# Nord

hlwm_base00='#2E3440'
hlwm_base01='#3B4252'
hlwm_base02='#434C5E'
hlwm_base03='#4C566A'
hlwm_base04='#D8DEE9'
hlwm_base05='#E5E9F0'
hlwm_base06='#ECEFF4'
hlwm_base07='#8FBCBB'
hlwm_base08='#BF616A'
hlwm_base09='#D08770'
hlwm_base0A='#EBCB8B'
hlwm_base0B='#A3BE8C'
hlwm_base0C='#88C0D0'
hlwm_base0D='#81A1C1'
hlwm_base0E='#B48EAD'
hlwm_base0F='#5E81AC'

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
