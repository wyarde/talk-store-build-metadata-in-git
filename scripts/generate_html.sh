#! /bin/sh

# Script invokes pandoc to generate html based on the markdown file.
# It chains pandoc together to enable variable substitution.

mkdir -p gh-pages

pandoc \
  index.md \
  --template index.md | \
pandoc \
  --standalone \
  --slide-level 3 \
  -t revealjs \
  -V revealjs-url=https://wyarde.github.io/reveal.js \
  -V theme=black \
  -o gh-pages/index.html