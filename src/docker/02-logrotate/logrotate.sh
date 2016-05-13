#!/bin/bash
set -e

exec logrotate -v /etc/logrotate.conf
