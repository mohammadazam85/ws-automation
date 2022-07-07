FROM centos:7
# Postgresql version
ENV PGVERSION=12
ENV PG_VERSION=12
ENV DB_NAME="xwiki"
ENV DB_USER="xwiki"
ENV DB_PASS="xwiki"
# Set the environment variables
ENV HOME /var/lib/pgsql
ENV PGDATA /var/lib/pgsql/12/data

RUN yum update -y \
    && yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
    && yum install -y sudo \
    pwgen \
    postgresql$PGVERSION \
    postgresql$PGVERSION-server \
    postgresql$PGVERSION-contrib && \
    yum clean all

# Working directory
WORKDIR /var/lib/pgsql

# Copy
COPY conf/postgresql-setup /usr/pgsql-$PG_VERSION/bin/postgresql-$PGVERSION-setup

# Run initdb
RUN chmod +x /usr/pgsql-$PG_VERSION/bin/postgresql-$PGVERSION-setup \
    && /usr/pgsql-$PG_VERSION/bin/postgresql-$PGVERSION-setup initdb

# Copy config file
COPY conf/postgresql.conf /var/lib/pgsql/$PG_VERSION/data/postgresql.conf
COPY conf/pg_hba.conf /var/lib/pgsql/$PG_VERSION/data/pg_hba.conf
COPY conf/postgresql.sh /usr/local/bin/postgresql.sh

# Change own user
RUN chown -R postgres:postgres /var/lib/pgsql/$PG_VERSION/data/* && \
    usermod -G wheel postgres && \
    sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers && \
    chmod +x /usr/local/bin/postgresql.sh

# Set volume
VOLUME ["/var/lib/pgsql"]


# Set username
USER postgres

# Expose ports.
EXPOSE 5432

# Run PostgreSQL Server
CMD ["/bin/bash", "/usr/local/bin/postgresql.sh"]

