#!/bin/bash -eux

args="$@"

sed -i "0,/REPLACEME/ s/REPLACEME/${args}/" /usr/local/bin/entrypoint.sh

touch /tmp/log

tail -f /tmp/log 2>&1 &

exec /lib/systemd/systemd --system --system-unit entrypoint.service --show-status=true
