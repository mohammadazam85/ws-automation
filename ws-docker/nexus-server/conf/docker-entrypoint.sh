#!/bin/bash
#set -x

echo "[Entrypoint] Sonatype Nexus Docker Image"

if [ "$1" = '/opt/sonatype/nexus/bin/nexus' ]; then
    set -- "$@"  "run"
fi
echo "[Entrypoint] Starting nexus: $@"
exec "$@"
status=$?
if [ $status -ne 0 ]; then
echo "[Entrypoint] Failed to start nexus: $status"
exit $status
fi
