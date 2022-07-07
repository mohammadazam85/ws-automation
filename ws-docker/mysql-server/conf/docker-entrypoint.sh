#!/bin/bash
#set -x

echo "[Entrypoint] MySQL Docker Image"
# Fetch value from server config
_get_config() {
  local conf="$1"
  shift
  "$@" --verbose --help 2>/dev/null | grep "^$conf" | awk '$1 == "'"$conf"'" { print $2; exit }'
}

# If command starts with an option, prepend mysqld
# This allows users to add command-line options without
# needing to specify the "mysqld" command
if [ "${1:0:1}" = '-' ]; then
  set -- mysqld "$@"
fi

if [ "$1" = 'mysqld' ]; then
  # Get config
  DATADIR="$(_get_config 'datadir' "$@")"
  SOCKET="$(_get_config 'socket' "$@")"
  echo "[Entrypoint] DATADIR=$DATADIR"
  if [ ! -f $DATADIR/ib_logfile0 ]; then
    echo "[Entrypoint] Databse dir is empty"
    echo "[Entrypoint] Initializing database"
    "$@" --initialize-insecure
    echo "[Entrypoint] Database initialized"
    echo "[Entrypoint] Reseting the root default password and allwoing remote connection."
    echo "[Entrypoint] Alert!!! Reset root password again with complex one."
    # wait to stable the process after start.
    SQL=$(mktemp -u /var/lib/mysql-files/XXXXXXXXXX)
    install /dev/null -m0600 -omysql -gmysql "$SQL"
    cat << EOF > "$SQL"
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MSQL_ROOT_PASSWORD}';
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MSQL_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOF
	set -- "$@" --init-file="$SQL"
	unset SQL
  fi
  echo "[Entrypoint] Starting mysql: $@"
  exec "$@"
  status=$?
  if [ $status -ne 0 ]; then
    echo "[Entrypoint] Failed to start mysql: $status"
    exit $status
  fi
fi
