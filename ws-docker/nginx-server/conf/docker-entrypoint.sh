#!/bin/bash
set -x

echo "[Entrypoint] Nginx Docker Image"

if [ "$1" = 'nginx' ]; then
    set -- "$@" "-g" "daemon off;"
fi
echo "[Entrypoint] Starting nginx: $@"
exec "$@"
status=$?
if [ $status -ne 0 ]; then
echo "[Entrypoint] Failed to start nginx: $status"
exit $status
fi
ps -ef |grep nginx |grep -v grep
