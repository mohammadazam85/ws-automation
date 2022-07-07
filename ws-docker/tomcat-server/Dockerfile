FROM centos:7
ENV CATALINA_HOME /opt/tools/tomcat
ENV CATLINA_BASE /opt/tools/tomcat
WORKDIR $CATALINA_HOME
COPY apache-tomcat-8.5.58.tar.gz /opt/tools/
# Install Java
RUN yum install --nogpgcheck -y java-1.8.0-openjdk
# Install tomcat
RUN mkdir -p /opt/tools/ \
    && cd  /opt/tools/ \
    &&  tar -zxf apache-tomcat-8.5.58.tar.gz -C /opt/tools/ \
    && cp -r /opt/tools/apache-tomcat-8.5.58/* /opt/tools/tomcat/
EXPOSE 8080
CMD ["/opt/tools/tomcat/bin/catalina.sh", "run"]