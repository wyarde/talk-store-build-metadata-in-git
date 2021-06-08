#! /bin/sh

# Script invokes pandoc to generate html based on the markdown file.
# It chains pandoc together to enable variable substitution.

if [ ! -d gh-pages ]; then
  echo "Fetching files from gh-pages branch..."
  mkdir -p gh-pages
  git clone -b gh-pages . gh-pages
  rm -rf ./gh-pages/.git
else
  echo "Folder already exists. Fetch skipped."
fi

echo "Generating html..."

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

echo "Done!"