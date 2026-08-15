#!/bin/sh
set -e

ssh_url="git@github.com:brandondong/dotfiles.git"
existing_url=$(git config --get remote.origin.url)

if [ "${existing_url}" != "${ssh_url}" ]; then
  git remote set-url origin "${ssh_url}"
  echo "Set repository url to '${ssh_url}'."
  if ! git fetch origin master; then
    echo "Test fetch failed, resetting url to '${existing_url}'." >&2
    git remote set-url origin "${existing_url}"
    exit 1
  fi
fi
