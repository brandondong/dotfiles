#!/bin/sh
set -e

# Only sudo if necessary.
if ! pacman -Qq "$@" >/dev/null 2>&1; then
  sudo pacman -S --needed --noconfirm "$@"
fi
