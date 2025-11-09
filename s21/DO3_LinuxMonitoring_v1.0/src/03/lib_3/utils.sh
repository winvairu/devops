#!/bin/bash

source "$(dirname "$0")/../02/lib_2/utils.sh"

validate_color_params() {
    local -a params=("$@")
    for param in "${params[@]}"; do
        if [[ "$param" -lt 1 || "$param" -gt 6 ]]; then
            echo "Error: Parameter $param is out of range (1-6)."
            exit 1
        fi
    done

    if [[ "${params[0]}" -eq "${params[1]}" ]]; then
        echo "Error: Background and foreground colors for titles must not match."
	echo "Run the script again."
        exit 1
    fi

    if [[ "${params[2]}" -eq "${params[3]}" ]]; then
        echo "Error: Background and foreground colors for values must not match."
	echo "Run the script again."
        exit 1
    fi
}

