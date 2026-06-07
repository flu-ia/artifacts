#!/bin/bash
set -e

echo "Starting Docker daemon..."
sudo dockerd --host=unix:///var/run/docker.sock > /dev/null 2>&1 &
timeout 15 bash -c 'until sudo docker info >/dev/null 2>&1; do sleep 1; done'

echo "Starting github runner..."
exec /home/runner/run.sh "$@"
