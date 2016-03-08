#!/bin/bash
set -e

[ "$DEBIAN_BASE_IMAGE" == "" ] && exit 42 # skip image
# FIXME Remove this when Docker supplies multi-arch base images
[[ -n "$(docker images -q $DEBIAN_BASE_IMAGE 2> /dev/null)" ]] || docker pull $DEBIAN_BASE_IMAGE
docker tag $DEBIAN_BASE_IMAGE rancher/os-resizefs-base
