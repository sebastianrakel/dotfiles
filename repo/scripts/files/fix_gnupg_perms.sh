#!/usr/bin/env bash

chown -R "$(whoami)" ~/.gnupg/

find ~/.gnupg -type f -exec chmod 600 {} \; # Set 600 for files
find ~/.gnupg -type d -exec chmod 700 {} \; # Set 700 for directories
