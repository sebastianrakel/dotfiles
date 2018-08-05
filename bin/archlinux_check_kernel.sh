#!/bin/bash
OUTPUT=${PRINT:-"1"} perl -E '$output = $ENV{"OUTPUT"} == "1"; ($run, $run_patch, $inst) = (`uname -r` =~ /([\w\d-.]+)-arch([\d]+)/g, `pacman -Q linux` =~ /linux\s+(.*)/g); say "Running Kernel: $run-$run_patch" if $output ; say "Installed Kernel: $inst" if $output ; exit 1 if "#{run}-#{run_patch}" != "#{inst}"'

rc=$?
 
if [[ $rc != 0 ]]; then
    echo "YOUR FUCKING KERNEL IS FUCKING OLD!"
fi
