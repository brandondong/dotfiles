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
  neofetch \
  ripgrep \
  zip

# Stow configuration files.
stow -d "./configs/" -t "${HOME}/" --no-folding --restow .

# Set login shell if not already fish (https://stackoverflow.com/a/11059152)
fish_path="/usr/bin/fish"
if [ $(getent passwd $LOGNAME | cut -d: -f7) != "${fish_path}" ]; then
  chsh -s "${fish_path}"
fi;

# Add ssh keys.
ssh_github_key="${HOME}/.ssh/id_github"
if [ ! -f "${ssh_github_key}" ]; then
  ssh-keygen -t ed25519 -N "" -C "github" -f "${ssh_github_key}"
fi;
