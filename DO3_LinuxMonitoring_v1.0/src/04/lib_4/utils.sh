#!/bin/bash

source "$(dirname "$0")/../03/lib_3/utils.sh"

extract_colors_from_config() {
    local config_file="final_config"
    if [[ ! -f "$config_file" ]]; then
        echo "Error: Configuration file '$config_file' not found."
        exit 1
    fi

    local colors=()
    while IFS= read -r line; do
        color=$(echo "$line" | grep -oP '\(([^)]+)\)' | tr -d '()')
        colors+=("$color")
    done < "$config_file"

    BG_TITLES="${colors[0]}"
    FG_TITLES="${colors[1]}"
    BG_VALUES="${colors[2]}"
    FG_VALUES="${colors[3]}"
}
