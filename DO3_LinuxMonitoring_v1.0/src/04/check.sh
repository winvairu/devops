#!/bin/bash

source "$(dirname "$0")/lib_4/config.sh"
source "$(dirname "$0")/lib_4/colors.sh"

OUTPUT_FILE="final_config"

clear_output_file "$OUTPUT_FILE"

check_config_file

for key in "${!DEFAULTS[@]}"; do
    get_final_color "$key" >> "$OUTPUT_FILE"
done

#display_final_config
