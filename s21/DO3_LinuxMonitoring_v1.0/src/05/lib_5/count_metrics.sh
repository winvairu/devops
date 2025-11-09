#!/bin/bash

count_folders() {
    find "$1" -type d | wc -l
}

count_files() {
    find "$1" -type f | wc -l
}

count_by_extension() {
    local dir="$1"
    local ext="$2"
    find "$dir" -type f -name "*.$ext" | wc -l
}
