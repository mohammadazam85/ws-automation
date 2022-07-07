FROM centos:7
ENV APACHE_HOME /etc/httpd
WORKDIR $APACHE_HOME
COPY conf/docker-entrypoint.sh /entrypoint.sh
RUN yum install --nogpgcheck -y httpd-2.4.6 \
   && mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf-org \
   && chmod +x /entrypoint.sh
COPY conf/httpd.conf /etc/httpd/conf
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/httpd"]
