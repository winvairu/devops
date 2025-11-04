#!/bin/bash

source "$(dirname "$0")/lib/my_lib_01.sh"

if [[ -z "$1" ]]; then
  echo "Error: A text parameter must be passed"
  exit 1
fi

if check_the_number "$1"; then
  echo "Error: Parameter \"$1\" is a number, text is expected"
  exit 2
fi

echo "$1"
