#!/bin/bash
set -e

BASE=$(dirname $0)


DIND_CONTAINER=$(docker create rancher/dind:v0.1.0)

function cleanup {
    docker rm -v ${DIND_CONTAINER}
    echo "Bye! You've been trapped :D"
}
trap cleanup EXIT


rm -rf ${BASE}/build
mkdir -p ${BASE}/build

docker cp ${DIND_CONTAINER}:/etc/ssl/certs/ca-certificates.crt ${BASE}/build/
