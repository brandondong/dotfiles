#!/bin/sh
set -e

# See https://wiki.archlinux.org/title/Pacman/Package_signing#Upgrade_system_regularly.
sudo pacman -Sy --needed archlinux-keyring
sudo pacman -Su --noconfirm

if command -v yay >/dev/null 2>&1; then
  yay --aur
fi

# See https://wiki.archlinux.org/title/Pacman#Cleaning_the_package_cache.
./pacman_install.sh pacman-contrib
paccache -r
