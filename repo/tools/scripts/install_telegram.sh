#!/usr/bin/env bash

telegram_path="${HOME}/.local/share"

if [ -f "${telegram_path}/Telegram/Telegram" ]; then
    echo "Telegram: already installed"
    exit 0
fi

telegram_archive_path="${telegram_path}/telegram.tar.gz"
mkdir -p "${telegram_path}"
curl -L "https://telegram.org/dl/desktop/linux" -o "${telegram_archive_path}"
tar xvaf "${telegram_archive_path}" -C "${telegram_path}"
rm "${telegram_archive_path}"
