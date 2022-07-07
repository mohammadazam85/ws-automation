
/usr/pgsql-12/bin/postgresql-12-setup initdb


PGDATA=/var/lib/pgsql/12/data/

/usr/pgsql-12/bin/postgresql-12-check-db-dir   /var/lib/pgsql/12/data/
/usr/pgsql-12/bin/postmaster -D /var/lib/pgsql/12/data/
ExecReload=/bin/kill -HUP 1975   1231
