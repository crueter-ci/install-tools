#!/bin/sh -e

: "${VERSION:=13.0.19.0}"
artifact="nv-codec-headers-$VERSION.tar.gz"
dir="nv-codec-headers-$VERSION"
repo=FFmpeg/nv-codec-headers
url="https://code.ffmpeg.org/$repo/releases/download/n$VERSION/$artifact"

curl -sfLO "$url"
tar xf "$artifact"

out="/c/hostedtoolcache/windows/ffnvcodec"
cd "$dir"
make PREFIX="$out" install
cd ..
rm -rf "$dir" "$artifact"

out_win=$(cygpath -w "$out")
echo "FFNVCODEC_DIR=$out_win" >> "$GITHUB_ENV"