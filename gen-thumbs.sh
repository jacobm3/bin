#!/usr/bin/env bash
# Usage: ./gen-thumbs.sh path/to/video.mp4

# 1) Input video
VIDEO="$1"

# 2) Number of screenshots we want total (8x7 = 56)
SAMPLES=56

# 3) Get total duration in seconds (as a floating-point number)
DURATION="$(ffprobe -v error -of csv=p=0 -show_entries format=duration "$VIDEO")"

# 4) Calculate the FPS needed to get exactly 56 frames from start to end
#    E.g. if the video is 280s long: 280 / 56 = 5s per frame, so fps = 1 / 5 = 0.2
#    We'll do the reverse:  fps = 56 frames / duration
FPS="$(awk -v dur="$DURATION" -v sam="$SAMPLES" 'BEGIN { print sam / dur }')"

# 5) Construct output filename, e.g. "video.mp4" -> "video.jpg"
BASENAME="${VIDEO%.*}"
OUTPUT="${BASENAME}.jpg"

# 6) Run ffmpeg, using the calculated FPS
#    - "fps=$FPS" samples frames evenly across the entire duration
#    - "scale=320:-1" resizes width to 320, preserving aspect ratio for height
#    - "tile=8x7" arranges the 56 frames into an 8x7 grid
#    - "-frames:v 1" outputs a single image
  #-pix_fmt yuv420p \
ffmpeg \
  -i "$VIDEO" \
  -vf "fps=$FPS,scale=320:-1:force_original_aspect_ratio=decrease,tile=8x7" \
  -frames:v 1 \
  "$OUTPUT"


