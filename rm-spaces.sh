#!/bin/bash

# breaks with directory names ENDING in a space

set -x

find -name "* *" -print0 | sort -rz | \
  while read -d $'\0' f; do mv -v "$f" "$(dirname "$f")/$(basename "${f// /_}")"; done