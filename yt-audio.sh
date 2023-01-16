#!/bin/bash

if (( $# < 1 )); then
  echo "$0 VIDEO_URL"
  exit 1
else
  URL="$1"; shift
fi

yt-dlp -f "ba" \
 -o "%(channel)s-%(title)s-%(id)s.%(ext)s" \
 --restrict-filenames \
  $URL
