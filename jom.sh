#!/bin/sh -e

case "$(uname -a)" in
	*ARM64*) arch=arm64 ;;
	*) arch=amd64 ;;
esac

repo=crueter-ci/jom
: "${JOM_VERSION:=1.1.7}"
artifact="jom-$arch.exe"

curl -sfL "https://github.com/$repo/releases/download/$JOM_VERSION/$artifact" -o jom.exe

out="/c/hostedtoolcache/windows/jom"
mkdir -p "$out"
mv jom.exe "$out"

out_win=$(cygpath -w "$out")
echo "$out_win" >> "$GITHUB_PATH"