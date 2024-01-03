#!/usr/bin/env sh

# Material Lighter

hlwm_base00='#FAFAFA'
hlwm_base01='#E7EAEC'
hlwm_base02='#CCEAE7'
hlwm_base03='#CCD7DA'
hlwm_base04='#8796B0'
hlwm_base05='#80CBC4'
hlwm_base06='#80CBC4'
hlwm_base07='#FFFFFF'
hlwm_base08='#FF5370'
hlwm_base09='#F76D47'
hlwm_base0A='#FFB62C'
hlwm_base0B='#91B859'
hlwm_base0C='#39ADB5'
hlwm_base0D='#6182B8'
hlwm_base0E='#7C4DFF'
hlwm_base0F='#E53935'

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
