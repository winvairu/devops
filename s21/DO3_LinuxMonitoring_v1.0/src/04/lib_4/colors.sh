#!/bin/bash

source "$(dirname "$0")/../03/lib_3/colors.sh"

VALID_RANGE="^[1-6]$"

declare -A COLORS=(
    ["1"]="white"
    ["2"]="red"
    ["3"]="green"
    ["4"]="blue"
    ["5"]="purple"
    ["6"]="black"
)

get_final_color() {
    local key="$1"
    local default_value="${DEFAULTS[$key]}"
    if [[ -n "${CONFIG[$key]}" && "${CONFIG[$key]}" =~ $VALID_RANGE ]]; then
        local value="${CONFIG[$key]}"
        local color_name="${COLORS[$value]}"
        FINAL_CONFIG["$key"]="$value ($color_name)"
        echo "$key = $value ($color_name)"
    else
        FINAL_CONFIG["$key"]="default ($default_value)"
        echo "$key = default ($default_value)"
    fi
}

display_final_config() {
    echo ""
    for key in "${!FINAL_CONFIG[@]}"; do
        echo "$key = ${FINAL_CONFIG[$key]}"
    done
}
