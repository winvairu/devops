#!/bin/bash

top_folders_by_size() {
    du -sh "$1"/* 2>/dev/null | sort -rh | head -n "$2"
}

top_files_by_size() {
    find "$1" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n "$2"
}

top_executables_by_size() {
    find "$1" -type f -executable -exec du -h {} + 2>/dev/null | sort -rh | head -n "$2"
}
