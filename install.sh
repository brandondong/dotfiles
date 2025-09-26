#!/bin/sh
set -e

sudo pacman -S --needed --noconfirm \
  git \
  lazygit \
  git-delta \
  fish \
  starship \
  zoxide \
  micro \
  stow \
  openssh \
  ripgrep \
  fzf \
  zip \
  unzip \
  imagemagick \
  ffmpeg \
  yt-dlp \
  base-devel

# Stow configuration files.
stow -d "./configs/" -t "${HOME}/" --no-folding --restow .

# Set login shell if not already fish (https://stackoverflow.com/a/11059152).
fish_path="/usr/bin/fish"
if [ $(getent passwd $LOGNAME | cut -d: -f7) != "${fish_path}" ]; then
  chsh -s "${fish_path}"
fi;

# Set up AUR.
if ! command -v yay 2>&1 >/dev/null
then
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ../
  rm -rf yay-bin/
fi

# Add Github ssh key.
ssh_github_key="${HOME}/.ssh/id_github"
if [ ! -f "${ssh_github_key}" ]; then
  ssh-keygen -t ed25519 -N "" -C "github" -f "${ssh_github_key}"
fi;
