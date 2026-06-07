#!/bin/bash
set -e

sudo dockerd --host=unix:///var/run/docker.sock > /dev/null 2>&1 &
timeout 15 bash -c 'until sudo docker info >/dev/null 2>&1; do sleep 1; done'

exec /home/runner/run.sh "$@"
