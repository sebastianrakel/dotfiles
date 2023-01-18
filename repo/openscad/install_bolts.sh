#!/usr/bin/env bash

download_url="https://github.com/boltsparts/BOLTS_archive/releases/download/v0.4.1/boltsos_0.4.1.tar.gz"
openscad_path="${HOME}/.local/share/OpenSCAD/libraries"
bolts_path="${openscad_path}/bolts"

if [ -d "${bolts_path}" ]; then
    echo "OpenSCAD: Bolts: already installed"
    exit 0
fi

echo "OpenSCAD: Bolts: installing"
mkdir -p "${bolts_path}"
temp_file=$(mktemp)
echo "Downloading to: ${temp_file}"
curl -L "${download_url}" -o "${temp_file}"
tar xvaf "${temp_file}" -C "${bolts_path}"
