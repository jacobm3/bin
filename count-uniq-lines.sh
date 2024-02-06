#!/bin/bash

declare -A line_counts

while IFS= read -r line; do
  ((line_counts["$line"]++))
done

for line in "${!line_counts[@]}"; do
  #echo "$line: ${line_counts[$line]}"
  echo "${line_counts[$line]}: $line"
done

