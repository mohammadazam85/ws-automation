FROM centos:7
ENV NGINX_HOME=/etc/nginx
WORKDIR $NGINX_HOME
COPY conf/nginx.repo /etc/yum.repos.d/
COPY conf/docker-entrypoint.sh /entrypoint.sh

RUN yum install --nogpgcheck -y nginx-1.18.0  \
    && chmod +x /entrypoint.sh

COPY certs /etc/nginx/certs/
COPY conf/default.conf /etc/nginx/conf.d/
VOLUME /usr/share/nginx/html 

EXPOSE 80 443
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["nginx"]
