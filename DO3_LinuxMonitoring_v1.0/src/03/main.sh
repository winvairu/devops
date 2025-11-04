#!/bin/bash

source "$(dirname "$0")/lib_3/system_info.sh"
source "$(dirname "$0")/lib_3/utils.sh"
source "$(dirname "$0")/lib_3/colors.sh"

if [[ $# -ne 4 ]]; then
    echo "Error: You must provide exactly 4 parameters."
    echo "Usage: $0 <bg_titles> <fg_titles> <bg_values> <fg_values>"
    exit 1
fi

declare -a COLORS=("white" "red" "green" "blue" "purple" "black")
validate_color_params "$@"

declare -A SYSTEM_INFO
declare -a KEYS_ORDER=(
    "HOSTNAME" "TIMEZONE" "USER" "OS" "DATE" "UPTIME" "UPTIME_SEC"
    "IP" "MASK" "GATEWAY" "RAM_TOTAL" "RAM_USED" "RAM_FREE"
    "SPACE_ROOT" "SPACE_ROOT_USED" "SPACE_ROOT_FREE"
)

collect_system_info SYSTEM_INFO

BG_TITLES="${COLORS[$(($1 - 1))]}"
FG_TITLES="${COLORS[$(($2 - 1))]}"
BG_VALUES="${COLORS[$(($3 - 1))]}"
FG_VALUES="${COLORS[$(($4 - 1))]}"

for key in "${KEYS_ORDER[@]}"; do
    print_colored_line "$BG_TITLES" "$FG_TITLES" "$key" "$BG_VALUES" "$FG_VALUES" "${SYSTEM_INFO[$key]}"
done
