#!/bin/bash
set -e

EXTRA_ARCHS='arm arm64'

cd $(dirname $0)

./scripts/build-images

for arch in ${EXTRA_ARCHS}; do
    echo ''
    if [ -f ./.docker-env.${arch} ]; then
        ARCH=${arch} ./scripts/build-images || :
    else
        echo "WARN: Can't build for 'ARCH=${arch}': ./.docker-env.${arch} doesn't exist"
    fi
    echo ''
done
