#!/bin/sh

# dockerd start
dockerd > /var/log/dockerd.log 2>&1 &
sleep 2

docker-compose -f /dock/docker-compose.yaml up

exec "$@"
