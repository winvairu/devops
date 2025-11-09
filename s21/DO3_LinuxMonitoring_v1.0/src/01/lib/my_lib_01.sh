#!bin/bash

check_the_number() {
    local input="$1"
    if [[ "$input" =~ [0-9] ]]; then
        return 0;
    else
        return 1;
    fi
}
