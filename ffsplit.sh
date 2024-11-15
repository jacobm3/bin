#!/bin/bash

# Function to display help
function show_help {
    echo "Usage: $0 -i <input_file> -s <start_time> -e <end_time>"
    echo
    echo "Options:"
    echo "  -i <input_file>    Input video file"
    echo "  -s <start_time>    Start time in hh:mm:ss or seconds format"
    echo "  -e <end_time>      End time in hh:mm:ss or seconds format"
    echo
    echo "Example:"
    echo "  $0 -i video.mp4 -s 00:00:00 -e 00:05:00"
}

# Parse command-line arguments
while getopts "i:s:e:h" opt; do
    case $opt in
        i) input_file="$OPTARG" ;;
        s) start_time="$OPTARG" ;;
        e) end_time="$OPTARG" ;;
        h) show_help; exit 0 ;;
        *) show_help; exit 1 ;;
    esac
done

# Validate arguments
if [[ -z "$input_file" || -z "$start_time" || -z "$end_time" ]]; then
    echo "Error: Missing required arguments."
    show_help
    exit 1
fi

# Extract filename and extension
filename="${input_file%.*}"
extension="${input_file##*.}"

# Generate output filename
output_file="${filename}.${start_time//:/_}.${end_time//:/_}.${extension}"

# Run ffmpeg command
ffmpeg -i "$input_file" -ss "$start_time" -to "$end_time" -c copy "$output_file"

echo
echo ffmpeg -i "$input_file" -ss "$start_time" -to "$end_time" -c copy "$output_file"
echo

# Check if ffmpeg succeeded
if [[ $? -eq 0 ]]; then
    echo "Output saved to: $output_file"
else
    echo "Error: ffmpeg failed."
    exit 1
fi
