#!/usr/bin/env bash
test -d /lib/modules/$(uname -r)/kernel/ || echo 'YOUR FUCKING KERNEL IS FUCKING OLD!'
