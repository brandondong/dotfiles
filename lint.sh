#!/bin/sh
set -e

./pacman_install.sh shellcheck

if ! command -v shfmt >/dev/null 2>&1; then
  ./pacman_install.sh go
  go install mvdan.cc/sh/v3/cmd/shfmt@latest
fi

lint() {
  shellcheck "$@"
  shfmt -l -w "$@"
}

lint ./*sh ./configs/.git-hooks/*
