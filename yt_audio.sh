#!/bin/sh
set -e

if [ -z "$1" ]; then
  echo "Missing video url argument." >&2
  exit 1
fi

./pacman_install.sh yt-dlp

yt-dlp -f bestaudio -o "output.%(ext)s" "$1"
