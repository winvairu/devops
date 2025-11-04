#!/bin/bash

source "$(dirname "$0")/lib_5/count_metrics.sh"
source "$(dirname "$0")/lib_5/find_top.sh"
source "$(dirname "$0")/lib_5/utils.sh"

if [[ -z "$1" || ! -d "$1" ]]; then
    echo "Usage: $0 <directory ending with />"
    exit 1
fi

DIR="$1"
[[ "${DIR: -1}" != "/" ]] && DIR="${DIR}/"

START_TIME=$(date +%s.%N)

TOTAL_FOLDERS=$(count_folders "$DIR" 2>/dev/null)
TOTAL_FILES=$(count_files "$DIR" 2>/dev/null)
CONF_FILES=$(count_by_extension "$DIR" "conf" 2>/dev/null)
TEXT_FILES=$(find "$DIR" -type f -exec file {} + 2>/dev/null | grep -c 'text')
EXEC_FILES=$(find "$DIR" -type f -executable 2>/dev/null | wc -l)
LOG_FILES=$(count_by_extension "$DIR" "log" 2>/dev/null)
ARCHIVE_FILES=$(find "$DIR" -type f -exec file {} + 2>/dev/null | grep -ciE 'archive|compressed')
SYMLINKS=$(find "$DIR" -type l 2>/dev/null | wc -l)

TOP_FOLDERS=$(top_folders_by_size "$DIR" 5 2>/dev/null | awk '{print NR " - " $2 ", " $1}')
TOP_FILES=$(top_files_by_size "$DIR" 10 2>/dev/null | while read -r size file; do
    type=$(file -b "$file" | awk '{print $1}')
    echo "$size $file $type"
done | awk '{print NR " - " $2 ", " $1 ", " $3}')
TOP_EXEC_FILES=$(top_executables_by_size "$DIR" 10 2>/dev/null | while read -r size file; do
    hash=$(get_md5_hash "$file")
    echo "$size $file $hash"
done | awk '{print NR " - " $2 ", " $1 ", " $3}')

END_TIME=$(date +%s.%N)
EXEC_TIME=$(echo "$END_TIME - $START_TIME" | bc)

echo "Total number of folders (including all nested ones) = $TOTAL_FOLDERS"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$TOP_FOLDERS"
echo "Total number of files = $TOTAL_FILES"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $CONF_FILES"
echo "Text files = $TEXT_FILES"
echo "Executable files = $EXEC_FILES"
echo "Log files (with the extension .log) = $LOG_FILES"
echo "Archive files = $ARCHIVE_FILES"
echo "Symbolic links = $SYMLINKS"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$TOP_FILES"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$TOP_EXEC_FILES"
echo "Script execution time (in seconds) = $EXEC_TIME"
