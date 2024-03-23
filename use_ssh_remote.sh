#!/bin/sh
set -e

ssh_url="git@github.com:brandondong/dotfiles.git"
git remote set-url origin "${ssh_url}"
echo "Set repository url to ${ssh_url}"
