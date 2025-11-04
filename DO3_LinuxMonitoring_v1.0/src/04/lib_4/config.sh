#!/bin/bash

CONFIG_FILE="default_config"

declare -A DEFAULTS=(
    ["column1_background"]="black"
    ["column1_font_color"]="white"
    ["column2_background"]="red"
    ["column2_font_color"]="blue"
)

declare -A CONFIG
declare -A FINAL_CONFIG

check_config_file() {
    if [[ ! -f "$CONFIG_FILE" ]]; then
        echo "Warning: Configuration file not found. Using default values."
    elif [[ ! -r "$CONFIG_FILE" ]]; then
        echo "Warning: Configuration file not readable. Using default values."
    else
        load_config_from_file
    fi
}

load_config_from_file() {
    while IFS="=" read -r key value; do
        if [[ -n "$key" && -n "$value" ]]; then
            CONFIG["$key"]="$value"
        fi
    done < "$CONFIG_FILE"
}

clear_output_file() {
    local file="$1"
    > "$file"
}
