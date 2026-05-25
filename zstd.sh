#!/bin/sh -e

case "$(uname -a)" in
	*ARM64*) arch=arm64 ;;
	*) arch=amd64 ;;
esac

repo=crueter-ci/zstd
: "${ZSTD_VERSION:=1.5.7}"
artifact="zstd-$arch.exe"

curl -sfL "https://github.com/$repo/releases/download/v$ZSTD_VERSION/$artifact" -o zstd.exe

out="/c/hostedtoolcache/windows/zstd"
mkdir -p "$out"
mv zstd.exe "$out"

out_win=$(cygpath -w "$out")
echo "$out_win" >> "$GITHUB_PATH"