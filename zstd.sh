#!/bin/sh -e

case "$PROCESSOR_ARCHITECTURE" in
	AMD64) arch=amd64 ;;
	ARM64) arch=arm64 ;;
	*) echo "Unsupported architecture $PROCESSOR_ARCHITECTURE"; exit 1 ;;
esac

repo=crueter-ci/zstd
: "${ZSTD_VERSION:?}"
artifact="zstd-$arch.exe"

curl -sfL "https://github.com/$repo/releases/download/v$PKGCONF_VERSION/$artifact" -o zstd.exe

out="/c/hostedtoolcache/windows/zstd"
mkdir -p "$out"
mv zstd.exe "$out"

out_win=$(cygpath -w "$out")
echo "$out_win" >> "$GITHUB_PATH"