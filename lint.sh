#!/bin/sh
set -e

if ! command -v shellcheck >/dev/null 2>&1; then
  sudo pacman -S --needed --noconfirm shellcheck
fi

if ! command -v shfmt >/dev/null 2>&1; then
  sudo pacman -S --needed --noconfirm go
  go install mvdan.cc/sh/v3/cmd/shfmt@latest
fi

lint() {
  shellcheck "$@"
  shfmt -l -w "$@"
}

lint ./*sh ./configs/.git-hooks/*
