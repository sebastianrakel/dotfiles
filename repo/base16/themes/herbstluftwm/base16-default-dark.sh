#!/usr/bin/env sh

# Default Dark

hlwm_base00='#181818'
hlwm_base01='#282828'
hlwm_base02='#383838'
hlwm_base03='#585858'
hlwm_base04='#b8b8b8'
hlwm_base05='#d8d8d8'
hlwm_base06='#e8e8e8'
hlwm_base07='#f8f8f8'
hlwm_base08='#ab4642'
hlwm_base09='#dc9656'
hlwm_base0A='#f7ca88'
hlwm_base0B='#a1b56c'
hlwm_base0C='#86c1b9'
hlwm_base0D='#7cafc2'
hlwm_base0E='#ba8baf'
hlwm_base0F='#a16946'

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
