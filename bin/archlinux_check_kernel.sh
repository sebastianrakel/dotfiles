#!/bin/bash
OUTPUT=${PRINT:-"1"} perl -E '$output = $ENV{"OUTPUT"} == "1"; ($run, $inst) = (`uname -a` =~ /([\w\d-.]+)-ARCH/g, `pacman -Qi linux` =~ /Version\s+:\s+(.*)/g); say "Running Kernel: $run" if $output ; say "Installed Kernel: $inst" if $output ; exit 1 if $run ne $inst'

rc=$?

if [[ $rc != 0 ]]; then
    echo "YOUR FUCKING KERNEL IS FUCKING OLD!"
fi
