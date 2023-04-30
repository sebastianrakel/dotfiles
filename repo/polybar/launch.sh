#!/usr/bin/env sh

monitor_index="${1}"
IFS=$'\n' monitors=( $(polybar -m) )
monitor_line="${monitors[$monitor_index]}"
monitor=$(echo $monitor_line | awk -F: '{print $1}')

hostname=$(hostnamectl hostname)

export MONITOR=$monitor
export POLYBAR_MONITOR=$monitor_index
polybar "${hostname}" 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
