#!/bin/bash
USER=${MONGODB_USERNAME:-techops}
PASS=${MONGODB_PASSWORD:-admin123}
DB=${MONGODB_DBNAME:-admin}
ROLE=${MONGODB_ROLE:-userAdminAnyDatabase}

if [[ ! -e /.firstrun ]]; then
    # Start MongoDB service
    #/usr/bin/mongod --dbpath /data --nojournal &
    set -- "$@" "--config" "/etc/mongod.conf"
    exec "$@"
    while ! nc -vz localhost 27017; do sleep 1; done

    # Create User
    echo "Creating user: \"$USER\"..."
    mongo $DB --eval "db.createUser({ user: '$USER', pwd: '$PASS', roles: [ { role: '$ROLE', db: '$DB' }, 'readWriteAnyDatabase' ] });"
    # Stop MongoDB service
    /usr/bin/mongod --dbpath /data --shutdown

    echo "========================================================================"
    echo "MongoDB User: \"$USER\""
    echo "MongoDB Password: \"$PASS\""
    echo "MongoDB Database: \"$DB\""
    echo "MongoDB Role: \"$ROLE\""
    echo "========================================================================"

    touch /.firstrun
fi

# Start MongoDB
echo "[Entrypoint] Starting MongoDB: $@"
set -- "$@" "--auth" "--config" "/etc/mongod.conf"
exec "$@"
