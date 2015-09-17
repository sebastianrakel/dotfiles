#!/bin/bash

CPU_COUNT=`grep -E -o 'cpu[0-9]' /proc/stat | wc -l`
count=0
counter=1
cpuline=""
while [ $counter -le $CPU_COUNT ]; do
    if [[ ${#cpuline} -ne 0 ]]; then
        cpuline+=" "
    fi

    cpuline+="\${cpugraph cpu${counter} 20,50}"    
    count=$((count + 1))
 
    if (( $count % 4 == 0 )); then
        echo "\${alignc}${cpuline}"
        count=0 
        cpuline=""
    fi
    counter=$((counter + 1))
done <<< "$CPUS"
