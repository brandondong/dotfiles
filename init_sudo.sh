#!/bin/sh
set -e

if [ "$(id -u)" != 0 ]; then
  echo "This script should be run as root." >&2
  exit 1
fi

pacman -S --needed --noconfirm sudo msedit

export EDITOR="msedit"
visudo
