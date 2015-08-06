#!/bin/bash
set -x -e

TLS_PATH=/etc/docker/tls

rm -f /var/run/docker.pid

ARGS=$(echo $(ros config get rancher.user_docker.args | sed 's/^-//'))
ARGS="$ARGS $(echo $(ros config get rancher.user_docker.extra_args | sed 's/^-//'))"

if [ "$(ros config get rancher.user_docker.tls)" = "true" ]; then
    ARGS="$ARGS $(echo $(ros config get rancher.user_docker.tls_args | sed 's/^-//'))"
    ros tls generate --server -d $TLS_PATH
    cd $TLS_PATH
fi

if [ -e /var/lib/rancher/conf/docker ]; then
    source /var/lib/rancher/conf/docker
fi

exec /usr/bin/dockerlaunch /usr/bin/docker $ARGS $DOCKER_OPTS >/var/log/docker.log 2>&1
