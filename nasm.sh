#!/bin/sh -e

case "$PROCESSOR_ARCHITECTURE" in
	AMD64) ;;
	*) exit 0 ;;
esac

: "${VERSION:=3.01}"
artifact="nasm-$VERSION-win64.zip"
dir="nasm-$VERSION"
url="https://www.nasm.us/pub/nasm/releasebuilds/$VERSION/win64/$artifact"

curl -sfLO "$url"
unzip "$artifact"

out="/c/hostedtoolcache/windows/nasm"

mkdir -p "$out"
mv "$dir"/nasm.exe "$out"
mv "$dir"/ndisasm.exe "$out"
rm -rf "$dir"

out_win=$(cygpath -w "$out")
echo "$out_win" >> "$GITHUB_PATH"