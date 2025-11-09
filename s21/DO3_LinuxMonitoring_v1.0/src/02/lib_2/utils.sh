#!/bin/bash

check_dependencies() {
    for cmd in hostname timedatectl whoami lsb_release date uptime ip free df; do
        if ! command -v $cmd &>/dev/null; then
            echo "Error: The utility '$cmd' was not found. Install it and try again."
            exit 1
        fi
    done
}

save_to_file() {
    local -n info=$1
    local -n keys_order=$2
    local filename="$(date +"%d_%m_%y_%H_%M_%S").status"

    echo "Writing data to a file: $filename"
    {
        for key in "${keys_order[@]}"; do
            printf "%s = %s\n" "$key" "${info[$key]}"
        done
    } > "$filename"

    echo "The data has been successfully saved in $filename"
}
