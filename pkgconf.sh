#!/bin/sh -e

case "$(uname -a)" in
	*ARM64*) arch=arm64 ;;
	*) arch=amd64 ;;
esac

repo=crueter-ci/pkgconf
: "${PKGCONF_VERSION:=2.5.1}"
artifact="pkgconf-$arch.exe"

curl -sfL "https://github.com/$repo/releases/download/v$PKGCONF_VERSION/$artifact" -o pkgconf.exe

out="/c/hostedtoolcache/windows/pkgconf"
mkdir -p "$out"
cp pkgconf.exe "$out"/pkg-config.exe
mv pkgconf.exe "$out"

out_win=$(cygpath -w "$out")
echo "$out_win" >> "$GITHUB_PATH"