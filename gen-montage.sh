#!/usr/bin/env bash
# Usage: ./gen-thumbs.sh path/to/video.mp4

# 1) Input video
VIDEO="$1"
if [ -z "$VIDEO" ]; then
  echo "Usage: $0 path/to/video.mp4"
  exit 1
fi

# 2) Number of screenshots we want total (8x7 = 56)
SAMPLES=56

# 3) Get total duration in seconds (as a floating-point number)
DURATION="$(ffprobe -v error -of csv=p=0 -show_entries format=duration "$VIDEO")"

# 4) Calculate the FPS needed to get exactly 56 frames from start to end
#    E.g., if the video is 280s long: 280 / 56 = 5s/frame => fps=0.2
#    We'll do the reverse: fps = SAMPLES / DURATION
FPS="$(awk -v dur="$DURATION" -v sam="$SAMPLES" 'BEGIN { if (dur > 0) print sam / dur; else print 1 }')"

# 5) Construct intermediate and final output filenames
BASENAME="${VIDEO%.*}"
THUMBS_DIR=".tmp-thumbs.$$"        # Temporary directory to store individual frames
FINAL_IMAGE="${BASENAME}.montage.jpg"  # Final tiled image

# Clean up (optional) and recreate tmp-thumbs directory
rm -rf "$THUMBS_DIR"
mkdir -p "$THUMBS_DIR"

##########################################################################
# STEP 1: Generate individual frames (each with a timestamp)
##########################################################################
echo "==> Extracting frames with timestamps..."

time ffmpeg -hide_banner -loglevel warning -y \
  -i "$VIDEO" \
  -vf "fps=${FPS},
       scale=320:-1:force_original_aspect_ratio=decrease,
       drawtext=fontcolor=white:fontsize=20:x=10:y=H-th-10:shadowcolor=black:shadowx=2:shadowy=2:text='%{pts\\:hms}'" \
  -q:v 2 \
  "${THUMBS_DIR}/frame_%03d.jpg"

##########################################################################
# STEP 2: Combine frames into an 8x7 tiled contact sheet
##########################################################################
echo "==> Creating tiled montage (8x7) from frames..."

# Option A: Use FFmpeg to tile images into a single JPG
# -----------------------------------------------
# The glob pattern must match the extracted frames. 
# tile=8x7 => 8 columns, 7 rows, total 56 cells
time ffmpeg -hide_banner -loglevel warning -y \
  -pattern_type glob \
  -i "${THUMBS_DIR}/frame_*.jpg" \
  -vf "tile=8x7" \
  -frames:v 1 \
  -q:v 2 \
  "$FINAL_IMAGE"

# Option B: Use ImageMagick (montage) instead of FFmpeg (comment out Option A above):
# -----------------------------------------------
# montage "${THUMBS_DIR}/frame_*.jpg" -tile 8x7 -geometry +2+2 "$FINAL_IMAGE"

rm -fr $THUMBS_DIR
echo "==> Done. Created tiled thumbnails: $FINAL_IMAGE"

