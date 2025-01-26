#!/bin/bash

# Check for required commands: figlet and lolcat
if ! command -v figlet &> /dev/null; then
    echo "Error: figlet is not installed. Please install it and run this script again."
    exit 1
fi

if ! command -v lolcat &> /dev/null; then
    echo "Error: lolcat is not installed. Please install it and run this script again."
    exit 1
fi

# Function to display usage
usage() {
    echo "Usage: $0 input_file [percentage]" | lolcat
    echo "  input_file: The video file to be transcoded." | lolcat
    echo "  percentage (optional): Desired output file size as a percentage" | lolcat
    echo "    of the original file size. Defaults to 50." | lolcat
    echo "Example: $0 video.mp4 40" | lolcat
    echo "  This would produce an output approx. 40% of the original size." | lolcat
    exit 1
}

# Check number of arguments
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    usage
fi

# Assign arguments
INPUT="$1"
PERCENT="$2"

# Default to 50% if no second argument is given
if [ -z "$PERCENT" ]; then
    PERCENT=50
fi

THREADS=12

echo "Check Input" | lolcat
# Check if input file exists
if [ ! -f "$INPUT" ]; then
    echo "Error: Input file '$INPUT' does not exist." | lolcat
    exit 1
fi

# Derive the output filename by replacing extension with .webm
if [[ "$INPUT" == *.* ]]; then
    OUTPUT="${INPUT%.*}.shrinkto-${PERCENT}.webm"
else
    OUTPUT="${INPUT}.shrinkto-${PERCENT}.webm"
fi

echo "Bitrate Calculation" | lolcat
# Get the original video bitrate in bits per second
ORIGINAL_BITRATE=$(ffprobe -v error \
    -select_streams v:0 \
    -show_entries stream=bit_rate \
    -of default=noprint_wrappers=1:nokey=1 "$INPUT")

# ---- NEW LOGIC START ----
# If ffprobe returned "N/A", treat it as empty so fallback method is triggered
if [ "$ORIGINAL_BITRATE" == "N/A" ]; then
    ORIGINAL_BITRATE=""
fi
# ---- NEW LOGIC END ----

# If stream bitrate is not available (empty or "N/A"), estimate by filesize / duration
if [ -z "$ORIGINAL_BITRATE" ]; then
    FILE_SIZE=$(stat -c%s "$INPUT")  # Linux
    # FILE_SIZE=$(stat -f%z "$INPUT") # macOS
    DURATION=$(ffprobe -v error -show_entries format=duration \
        -of default=noprint_wrappers=1:nokey=1 "$INPUT")
    DURATION_INT=$(printf "%.0f" "$DURATION")
    if [ "$DURATION_INT" -gt 0 ]; then
        ORIGINAL_BITRATE=$(( (FILE_SIZE * 8) / DURATION_INT ))
    else
        echo "Error: Unable to determine video duration." | lolcat
        exit 1
    fi
fi

# Check if bitrate was determined or is valid
# Also handle weird negative or zero bitrates, just in case
if ! [[ "$ORIGINAL_BITRATE" =~ ^[0-9]+$ ]] || [ "$ORIGINAL_BITRATE" -le 0 ]; then
    echo "Error: Could not determine the original bitrate in numeric form." | lolcat
    exit 1
fi

# Calculate the target bitrate (convert to kbps).
TARGET_BITRATE=$(( ORIGINAL_BITRATE * PERCENT / 100 / 1000 ))

# Set audio bitrate (adjust as needed)
AUDIO_BITRATE="128k"

echo "Original Bitrate: $((ORIGINAL_BITRATE / 1000)) kbps" | lolcat
echo "Desired Percentage: $PERCENT%" | lolcat
echo "Target Video Bitrate: ${TARGET_BITRATE}k" | lolcat
echo "Audio Bitrate: $AUDIO_BITRATE" | lolcat
echo "Output File: $OUTPUT" | lolcat

echo "Two-Pass Encoding" | lolcat
echo "Starting Pass 1..." | lolcat

# First pass command
echo
echo "Running first pass command:" | lolcat
echo "ffmpeg -y -i \"$INPUT\" -c:v libvpx-vp9 -b:v \"${TARGET_BITRATE}k\" -pass 1 -speed 4 -row-mt 1 -threads $THREADS -an -f null /dev/null" | lolcat
echo

ffmpeg -y -i "$INPUT" \
       -c:v libvpx-vp9 \
       -b:v "${TARGET_BITRATE}k" \
       -pass 1 \
       -speed 4 \
       -row-mt 1 \
       -threads $THREADS \
       -an \
       -f null /dev/null

# Check if first pass was successful
if [ $? -ne 0 ]; then
    echo "Error: First pass encoding failed." | lolcat
    exit 1
fi

echo "Pass 1 Complete. Starting Pass 2..." | lolcat

# Second pass command
echo
echo "Running second pass command:" | lolcat
echo "ffmpeg -i \"$INPUT\" -c:v libvpx-vp9 -b:v \"${TARGET_BITRATE}k\" -pass 2 -speed 4 -threads $THREADS -row-mt 1 -c:a libopus -b:a \"$AUDIO_BITRATE\" \"$OUTPUT\"" | lolcat
echo

ffmpeg -i "$INPUT" \
       -c:v libvpx-vp9 \
       -b:v "${TARGET_BITRATE}k" \
       -pass 2 \
       -speed 4 \
       -threads $THREADS \
       -row-mt 1 \
       -c:a libopus \
       -b:a "$AUDIO_BITRATE" \
       "$OUTPUT"

# Check if second pass was successful
if [ $? -ne 0 ]; then
    echo "Error: Second pass encoding failed." | lolcat
    exit 1
fi

echo "Cleanup" | lolcat
rm -f ffmpeg2pass-0.log ffmpeg2pass-0.log.mbtree

echo
echo "Done." | lolcat
echo "Transcoding completed. Output file: $OUTPUT" | lolcat
echo

