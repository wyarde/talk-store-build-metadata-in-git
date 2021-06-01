#! /bin/sh

set -e

rm -rf gh-pages
git submodule add --force -b gh-pages ./ gh-pages