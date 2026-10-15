#!/bin/sh
set -e

fd -e sh | xargs ./lint_helper.sh ./home/.git-hooks/*
