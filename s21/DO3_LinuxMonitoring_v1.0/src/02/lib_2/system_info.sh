#!/bin/bash

collect_system_info() {
    local -n info=$1
    info=(
        [HOSTNAME]=$(get_hostname)
        [TIMEZONE]=$(get_timezone)
        [USER]=$(get_user)
        [OS]=$(get_os)
        [DATE]=$(get_date)
        [UPTIME]=$(get_uptime)
        [UPTIME_SEC]=$(get_uptime_seconds)
        [IP]=$(get_ip)
        [MASK]=$(get_mask)
        [GATEWAY]=$(get_gateway)
        [RAM_TOTAL]=$(get_ram_total)
        [RAM_USED]=$(get_ram_used)
        [RAM_FREE]=$(get_ram_free)
        [SPACE_ROOT]=$(get_space_root)
        [SPACE_ROOT_USED]=$(get_space_root_used)
        [SPACE_ROOT_FREE]=$(get_space_root_free)
    )
}

get_hostname() {
    hostname
}

get_timezone() {
    timedatectl | grep "Time zone" | awk '{print $3, $4, $5}'
}

get_user() {
    whoami
}

get_os() {
    lsb_release -d | awk -F'\t' '{print $2}'
}

get_date() {
    date +"%d %b %Y %H:%M:%S"
}

get_uptime() {
    uptime -p
}

get_uptime_seconds() {
    cat /proc/uptime | awk '{print int($1)}'
}

get_ip() {
    ip a | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d/ -f1 | head -n 1
}

get_mask() {
    ifconfig enp0s3 | grep "netmask" | awk '{print $4}'
}

get_gateway() {
    ip r | grep default | awk '{print $3}'
}

get_ram_total() {
    free -m | awk '/Mem:/ {printf "%.3f GB", $2 / 1024}'
}

get_ram_used() {
    free -m | awk '/Mem:/ {printf "%.3f GB", $3 / 1024}'
}

get_ram_free() {
    free -m | awk '/Mem:/ {printf "%.3f GB", $4 / 1024}'
}

get_space_root() {
    df / --block-size=1M | awk '/\// {printf "%.2f MB", $2}'
}

get_space_root_used() {
    df / --block-size=1M | awk '/\// {printf "%.2f MB", $3}'
}

get_space_root_free() {
    df / --block-size=1M | awk '/\// {printf "%.2f MB", $4}'
}
