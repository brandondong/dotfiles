#!/bin/sh
set -e

if [ "$(id -u)" = 0 ]; then
  echo "This script should not be run as root."
  exit 1
fi

./pacman_install.sh \
  git \
  lazygit \
  git-delta \
  fish \
  starship \
  zoxide \
  micro \
  stow \
  ripgrep \
  fzf \
  pacman-contrib \
  reflector

# Stow configuration files.
stow -d "./configs/" -t "${HOME}/" --no-folding --restow .

# Set login shell if not already fish (https://stackoverflow.com/a/11059152).
fish_path="/usr/bin/fish"
if [ "$(getent passwd "${LOGNAME}" | cut -d: -f7)" != "${fish_path}" ]; then
  chsh -s "${fish_path}"
fi

# Configure pacman:
# - Cleaning cache (https://wiki.archlinux.org/title/Pacman#Cleaning_the_package_cache)
# - Updating mirror list (https://wiki.archlinux.org/title/Reflector#systemd_timer)
if ! systemctl is-enabled paccache.timer --quiet; then
  sudo systemctl enable --now paccache.timer
fi
if ! systemctl is-enabled reflector.timer --quiet; then
  sudo systemctl enable --now reflector.timer
fi
