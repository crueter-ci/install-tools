#!/bin/sh -e

repo=FFmpeg/gas-preprocessor
artifact=gas-preprocessor.pl

url="https://github.com/$repo/raw/refs/heads/master/$artifact"

curl -sfLO "$url"
chmod a+x "$artifact"

out="/c/hostedtoolcache/windows/gas-preprocessor"
mkdir -p "$out"
cp "$artifact" "$out"/gas-preprocessor
mv "$artifact" "$out"

out_win=$(cygpath -w "$out")
echo "$out_win" >> "$GITHUB_PATH"