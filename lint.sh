#!/bin/sh
set -e

./pacman_install.sh shellcheck shfmt

lint() {
  shellcheck "$@"
  shfmt -l -w "$@"
}

lint ./*sh ./configs/.git-hooks/*
