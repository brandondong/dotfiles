#!/bin/sh
set -e

ssh_github_key="${HOME}/.ssh/id_github"
if [ ! -f "${ssh_github_key}" ]; then
  ./pacman_install.sh openssh
  ssh-keygen -t ed25519 -N "" -C "github" -f "${ssh_github_key}"
fi

echo "Public key (copy the whole line):"
cat "${ssh_github_key}.pub"
