#!/bin/bash
set -e

# FIXME Remove this when Docker supplies multi-arch base images
. .$ARCH.base-images
[[ -n "$(docker images -q $UBUNTU_BASE_IMAGE 2> /dev/null)" ]] || docker pull $UBUNTU_BASE_IMAGE
docker tag -f $UBUNTU_BASE_IMAGE rancher/os-ubuntuconsole-base

cd $(dirname $0)

rm -rf ./build
mkdir -p ./build
cp ./../01-base/entry.sh ./build/
cp ./../02-console/console.sh ./build/
cp ./../02-console/docker-init ./build/
cp ./../02-console/update-ssh-keys ./build/
cp ./../02-console/rancheros-install ./build/
