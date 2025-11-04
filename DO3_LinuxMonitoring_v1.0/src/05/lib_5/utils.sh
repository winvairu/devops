#!/bin/bash

get_file_type() {
    file -b "$1" | awk '{print $1}'
}

get_md5_hash() {
    md5sum "$1" | awk '{print $1}'
}
