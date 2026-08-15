#!/bin/sh
set -e

if [ -z "$1" ]; then
  echo "Missing video url argument."
  exit 1
fi

./pacman_install.sh yt-dlp

yt-dlp -f "bv*[height<=1080]+ba" --merge-output-format mp4 -o "output.%(ext)s" "$1"
