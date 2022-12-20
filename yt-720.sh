#!/bin/bash

if (( $# < 1 )); then
  echo "$0 PLAYLIST_ID"
  exit 1
else
  PLID="$1"; shift
fi

yt-dlp -f "bestvideo[height<=720]+bestaudio/best[height<=720]" \
 --yes-playlist \
 --embed-chapters \
 -o "%(channel)s/%(playlist_title)s-%(playlist_id)s/%(playlist_index)s-%(title)s-%(id)s.%(ext)s" \
  https://www.youtube.com/playlist?list=$PLID
