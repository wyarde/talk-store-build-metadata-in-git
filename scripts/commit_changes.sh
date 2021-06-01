#! /bin/sh

set -e

commit_title=$(git log -n 1 --format="%s" HEAD)
commit_hash=$(git log -n 1 --format="%H" HEAD)

cd gh-pages || exit 1

git config --local user.email "github-actions[bot]@users.noreply.github.com"
git config --local user.name "github-actions[bot]"

git add .
git diff-index --quiet HEAD || git commit -m "publish: $commit_title" -m "Generated from commit $commit_hash"
