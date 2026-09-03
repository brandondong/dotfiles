#!/bin/sh
set -e

if [ "$(id -u)" = 0 ]; then
  echo "This script should not be run as root." >&2
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
  reflector

# Stow configuration files.
stow -d "./configs/" -t "${HOME}/" --no-folding --restow .

# Set login shell if not already fish (https://stackoverflow.com/a/11059152).
fish_path="/usr/bin/fish"
if [ "$(getent passwd "${LOGNAME}" | cut -d: -f7)" != "${fish_path}" ]; then
  chsh -s "${fish_path}"
fi

# Configure pacman:
# - Cleaning cache (https://wiki.archlinux.org/title/Pacman#Cleaning_the_package_cache).
# - Updating mirror list (https://wiki.archlinux.org/title/Reflector#systemd_timer).
start_service() {
  if ! systemctl is-enabled "$1" --quiet; then
    sudo systemctl enable --now "$1"
  fi
}
stop_service() {
  if systemctl is-enabled "$1" --quiet; then
    sudo systemctl disable --now "$1"
  fi
}
stop_service paccache.timer # Managed manually in system upgrade script.
start_service reflector.timer
