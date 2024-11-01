#!/bin/bash

# Check if the filename is provided
if [ -z "$1" ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Input filename
input_file="$1"

# Extract the base name (remove extension) from the input filename
base_name="${input_file%.*}"

# Get the current date and time in the desired format
timestamp=$(date +"%Y%m%d.%H%M%S")

# Construct the output filename
output_file="${base_name}.90.${timestamp}.mp4"

# Run the ffmpeg command to flip the video upside down
ffmpeg -i "$input_file" -vf "transpose=1" -c:a copy -c:v libx264 "$output_file"

echo "Output saved to $output_file"

