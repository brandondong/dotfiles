#!/bin/sh
set -e

if ! command -v yay >/dev/null 2>&1; then
  ./pacman_install.sh base-devel

  temp_yay_bin_path="yay-bin-temp"
  git clone https://aur.archlinux.org/yay-bin.git "${temp_yay_bin_path}"
  makepkg -si --noconfirm --dir "${temp_yay_bin_path}"
  rm -rf "${temp_yay_bin_path}"
fi
