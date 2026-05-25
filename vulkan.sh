#!/bin/sh -e

case "$(uname -a)" in
	*ARM64*) arch=arm64 ;;
	*) arch=amd64 ;;
esac

# TODO: use zip?
repo=crueter-ci/Vulkan
: "${VULKAN_VERSION:=1.4.350.0}"
artifact="vulkan-$arch.tar.gz"

curl -sfLO "https://github.com/$repo/releases/download/v$VULKAN_VERSION/$artifact"

VULKAN_SDK="/c/hostedtoolcache/windows/vulkan"
mkdir -p "$VULKAN_SDK"

tar xf "$artifact" -C "$VULKAN_SDK"
rm "$artifact"

sdk_win=$(cygpath -w "$VULKAN_SDK")
printf "%s\\\\bin\n" "$sdk_win" >> "$GITHUB_PATH"
echo "VULKAN_SDK=$sdk_win" >> "$GITHUB_ENV"