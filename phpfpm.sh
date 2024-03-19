#!/bin/bash
# SETTINGS
declare -i average_process_need=150
declare -i unused_memory=300
# END OF SETTINGS

declare -i memory_in_megabytes=$(grep MemTotal /proc/meminfo | awk '{print $2/1024}' | awk '{print int($1+0.5)}')
available_memory=$(expr $memory_in_megabytes - $unused_memory)
max_children=$(expr $available_memory / $average_process_need)
declare -i cores=$(nproc)
declare -i max_spare_servers=$(expr $cores*4)
declare -i start_servers=$(expr $cores*4)
declare -i min_spare_servers=$(expr $cores*2)
echo "Tune PHP-FPM"
echo "Max Children $max_children"
echo "Max Spare servers $max_spare_servers"
echo "Start servers $start_servers"
echo "Min Spare servers $min_spare_servers"
echo "phpconfigfile: $phpconfigfile"
echo "average_process_need: $average_process_need"
echo "unused_memory: $unused_memory"
echo "memory_in_megabytes: $memory_in_megabytes"
echo "available_memory: $available_memory"
echo "cores: $cores"
