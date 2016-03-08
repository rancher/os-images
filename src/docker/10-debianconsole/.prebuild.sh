#!/bin/bash
set -e

[ "$DEBIAN_BASE_IMAGE" == "" ] && exit 42 # skip image
# FIXME Remove this when Docker supplies multi-arch base images
[[ -n "$(docker images -q $DEBIAN_BASE_IMAGE 2> /dev/null)" ]] || docker pull $DEBIAN_BASE_IMAGE
docker tag $DEBIAN_BASE_IMAGE rancher/os-debianconsole-base

cd $(dirname $0)

rm -rf ./build
mkdir -p ./build
cp ./../01-base/entry.sh ./build/
cp ./../02-console/console.sh ./build/
cp ./../02-console/docker-init ./build/
cp ./../02-console/update-ssh-keys ./build/
cp ./../02-console/rancheros-install ./build/
