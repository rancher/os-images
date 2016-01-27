#!/bin/bash
set -e

EXTRA_ARCHS='arm'

cd $(dirname $0)

./scripts/build-images

for arch in ${EXTRA_ARCHS}; do
    echo ''
    if [ -f ./.${arch}.docker-env ]; then
        ARCH=${arch} ./scripts/build-images || :
    else
        echo "WARN: Can't build for 'ARCH=${arch}': ./.${arch}.docker-env doesn't exist"
    fi
    echo ''
done
