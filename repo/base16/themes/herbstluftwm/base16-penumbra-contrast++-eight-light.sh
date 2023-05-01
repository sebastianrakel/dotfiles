#!/usr/bin/env sh

# penumbra contrast++ eight light

hlwm_base00='#FFF7ED'
hlwm_base01='#F2E6D4'
hlwm_base02='#DEDEDE'
hlwm_base03='#AEAEAE'
hlwm_base04='#636363'
hlwm_base05='#3E4044'
hlwm_base06='#181B1F'
hlwm_base07='#0D0F13'
hlwm_base08='#F58C81'
hlwm_base09='#A9B852'
hlwm_base0A='#E09F47'
hlwm_base0B='#54C794'
hlwm_base0C='#00C4D7'
hlwm_base0D='#6EB2FD'
hlwm_base0E='#B69CF6'
hlwm_base0F='#E58CC5'

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
