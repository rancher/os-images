#!/bin/bash
set -e

[ "$UBUNTU_BASE_IMAGE" == "" ] && exit 42 # skip image
# FIXME Remove this when Docker supplies multi-arch base images
[[ -n "$(docker images -q $UBUNTU_BASE_IMAGE 2> /dev/null)" ]] || docker pull $UBUNTU_BASE_IMAGE
docker tag $UBUNTU_BASE_IMAGE rancher/os-resizefs-base
