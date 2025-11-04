#!/bin/bash

# ANSI color codes
declare -A COLOR_CODES=(
    [white]="\033[97m"
    [red]="\033[91m"
    [green]="\033[92m"
    [blue]="\033[94m"
    [purple]="\033[95m"
    [black]="\033[30m"
)

declare -A BG_COLOR_CODES=(
    [white]="\033[107m"
    [red]="\033[101m"
    [green]="\033[102m"
    [blue]="\033[104m"
    [purple]="\033[105m"
    [black]="\033[40m"
)

RESET_COLOR="\033[0m"

print_colored_line() {
    local bg_title=$1
    local fg_title=$2
    local title=$3
    local bg_value=$4
    local fg_value=$5
    local value=$6

    printf "%b%b %s %b%b %b%s %b\n" \
        "${BG_COLOR_CODES[$bg_title]}" "${COLOR_CODES[$fg_title]}" "$title" "$RESET_COLOR" \
        "${BG_COLOR_CODES[$bg_value]}" "${COLOR_CODES[$fg_value]}" "$value" "$RESET_COLOR"
}
