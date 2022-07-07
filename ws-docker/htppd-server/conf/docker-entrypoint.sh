#!/bin/bash
#set -x

echo "[Entrypoint] HTTPD Docker Image"

if [ "$1" = '/usr/sbin/httpd' ]; then
    set -- "$@"  "-D" "FOREGROUND"
fi
echo "[Entrypoint] Starting httpd: $@"
exec "$@"
status=$?
if [ $status -ne 0 ]; then
echo "[Entrypoint] Failed to start httpd: $status"
exit $status
fi
