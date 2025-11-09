#!/bin/bash

source "$(dirname "$0")/lib_2/system_info.sh"
source "$(dirname "$0")/lib_2/utils.sh"

check_dependencies

declare -A SYSTEM_INFO
declare -a KEYS_ORDER=(
    "HOSTNAME" "TIMEZONE" "USER" "OS" "DATE" "UPTIME" "UPTIME_SEC"
    "IP" "MASK" "GATEWAY" "RAM_TOTAL" "RAM_USED" "RAM_FREE"
    "SPACE_ROOT" "SPACE_ROOT_USED" "SPACE_ROOT_FREE"
)

collect_system_info SYSTEM_INFO

for key in "${KEYS_ORDER[@]}"; do
    printf "%s = %s\n" "$key" "${SYSTEM_INFO[$key]}"
done

read -p "Write the data to a file? (Y/N): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    save_to_file SYSTEM_INFO KEYS_ORDER
else
    echo "The data has not been saved."
fi
