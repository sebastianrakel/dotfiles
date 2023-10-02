#!/usr/bin/env bash

workspace="${1}"
hostname=$(hostname)
config_dir="${HOME}/.config/workspaces/"

if [[ -z "${workspace}" ]]; then
    workspaces="${config_dir}"$hostname_*.sh
    for file in $workspaces
    do
	workspace_name=$(basename "${file}")
	workspace_name="${workspace_name/.sh/}"
	workspace_name="${workspace_name/"${hostname}_"/}"
	echo $workspace_name
    done
    exit 0
fi

"${config_dir}${hostname}_${workspace}.sh"
exit 0
