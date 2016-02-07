#!/bin/bash
set -e

# FIXME Remove this when Docker supplies multi-arch base images
. .$ARCH.base-images
[[ -n "$(docker images -q $DEBIAN_BASE_IMAGE 2> /dev/null)" ]] || docker pull $DEBIAN_BASE_IMAGE
docker tag -f $DEBIAN_BASE_IMAGE rancher/os-resizefs-base
