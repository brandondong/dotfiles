#!/bin/sh
set -e

cat config-unchanged-list.txt | xargs git update-index --assume-unchanged --
