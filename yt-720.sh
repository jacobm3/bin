#!/bin/bash

if (( $# < 1 )); then
  echo "$0 URL"
  exit 1
else
  PLID="$1"; shift
fi

yt-dlp -f "mp4[height<=720]+bestaudio/best[height<=720]" \
 -o "%(channel)s/%(title)s-%(id)s.%(ext)s" \
  $PLID
