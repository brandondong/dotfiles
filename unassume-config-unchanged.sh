#!/bin/sh
set -e

git ls-files -- home_assume_unchanged | xargs git update-index --no-assume-unchanged --
