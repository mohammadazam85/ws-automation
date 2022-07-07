FROM centos:7
ENV DATA_DIR=/var/lib/mongo
ENV LOG_DIR=/var/log/mongodb
WORKDIR $DATA_DIR
COPY conf/mongodb-org-4.4.repo /etc/yum.repos.d/
COPY conf/mongod.conf /etc/
COPY conf/docker-entrypoint.sh /entrypoint.sh

# Install mongodb
RUN yum update -y \
    && yum install -y mongodb-org

# Set up directory requirements
RUN mkdir -p /var/lib/mongo /var/log/mongodb /var/run/mongodb \
    && chmod +x /entrypoint.sh \
    && touch /var/log/mongodb/mongod.log 

VOLUME ["/var/lib/mongo", "/var/log/mongodb"]

# Expose port 27017 from the container to the host
EXPOSE 27017

# Start mongodb
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/mongod"]