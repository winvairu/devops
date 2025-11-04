#!/bin/bash

source "$(dirname "$0")/lib_4/system_info.sh"
source "$(dirname "$0")/lib_4/utils.sh"
source "$(dirname "$0")/lib_4/colors.sh"
source "$(dirname "$0")/lib_4/config.sh"
source "$(dirname "$0")/check.sh"

./check.sh

extract_colors_from_config

declare -A SYSTEM_INFO
declare -a KEYS_ORDER=(
    "HOSTNAME" "TIMEZONE" "USER" "OS" "DATE" "UPTIME" "UPTIME_SEC"
    "IP" "MASK" "GATEWAY" "RAM_TOTAL" "RAM_USED" "RAM_FREE"
    "SPACE_ROOT" "SPACE_ROOT_USED" "SPACE_ROOT_FREE"
)

collect_system_info SYSTEM_INFO

for key in "${KEYS_ORDER[@]}"; do
    print_colored_line "$BG_TITLES" "$FG_TITLES" "$key" "$BG_VALUES" "$FG_VALUES" "${SYSTEM_INFO[$key]}"
done

display_final_config
