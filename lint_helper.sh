#!/bin/sh
set -e

./pacman_install.sh shellcheck shfmt
shellcheck "$@"
shfmt -l -w "$@"
