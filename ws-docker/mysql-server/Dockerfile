FROM centos:7
# Install mysql server
ENV MSQL_ROOT_PASSWORD='abc123'
COPY conf/my.cnf /etc/
COPY conf/mysql-community.repo /etc/yum.repos.d/
COPY conf/docker-entrypoint.sh /entrypoint.sh
RUN yum install --nogpgcheck -y mysql-community-server-5.7.31 \
   && chmod +x /entrypoint.sh
VOLUME /var/lib/mysql  /var/log
USER mysql
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 3306
CMD ["mysqld"]