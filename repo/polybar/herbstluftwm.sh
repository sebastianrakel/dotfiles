#!/bin/sh

hash herbstclient xrandr

declare -A icons
icons=( ["main"]="" ["www"]="" ["cad"]="" ["dev"]="" ["virt"]="" ["remote"]="" ["stuff"]="" ["games"]="")

print_tags() {
	for tag in $(herbstclient tag_status "$1"); do
		name=${tag#?}
		state=${tag%$name}
		case "$state" in
		'#')
			printf '%%{R} %s %%{R} ' "${icons[$name]}"
			;;
		'+')
			printf '%%{F#cccccc}%%{R} %s %%{R}%%{F-}' "${icons[$name]}"
			;;
		'!')
			printf '%%{R} %s! %%{R}' "${icons[$name]}"
			;;
		'.')
			printf '%%{F#cccccc} %s %%{F-}' "${icons[$name]}"
			;;
		*)
			printf ' %s ' "${icons[$name]}"
		esac
	done
	printf '\n'
}

geom_regex='[[:digit:]]\+x[[:digit:]]\++[[:digit:]]\++[[:digit:]]\+'
geom=$(xrandr --query | grep "^$MONITOR" | grep -o "$geom_regex")
monitor=$(herbstclient list_monitors | grep "$geom" | cut -d: -f1)

print_tags "$monitor"

IFS="$(printf '\t')" herbstclient --idle | while read -r hook args; do
	case "$hook" in
	tag*)
		print_tags "$monitor"
		;;
	esac
done
