#!/bin/sh
set -e

ssh_url="git@github.com:brandondong/dotfiles.git"

if [ "$(git config --get remote.origin.url)" != "${ssh_url}" ]; then
  git remote set-url origin "${ssh_url}"
  echo "Set repository url to ${ssh_url}"
  git fetch origin master
fi;
