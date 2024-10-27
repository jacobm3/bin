#!/bin/bash

# Check if an argument was provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <input-file> [codec] [bitrate]"
    echo "This script vertically flips the video file and appends '-vflip' to the output filename."
    exit 1
fi

if [ ! -r "$1" ]; then
    echo "Error: Input file '$1' is not readable or does not exist."
    exit 1
fi

if [ -z "$2" ]; then
    CODEC="vp9"
else
    CODEC="$2"
fi

if [ -z "$3" ]; then
    BITRATE="1500k"
else
    BITRATE="$3"
fi

# Extract the filename without the extension
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# vertically flip the video and save it with 'vflip' and codec info appended before the extension
time ffmpeg -i "$1" -vf "vflip" -c:v $CODEC -b:v $BITRATE -c:a copy "${filename}-vflip-${CODEC}-${BITRATE}.${extension}"

