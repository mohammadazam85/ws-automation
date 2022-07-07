FROM centos:7
ENV NEXUS_HOME /opt/sonatype
WORKDIR $NEXUS_HOME
RUN mkdir -p $NEXUS_HOME \
   && yum update -y \
   && yum install -y java-1.8.0-openjdk.x86_64
COPY nexus-3.28.0-01-unix.tar.gz $NEXUS_HOME/
COPY conf/docker-entrypoint.sh /entrypoint.sh

RUN cd $NEXUS_HOME/ \
   && tar -zxf nexus-3.28.0-01-unix.tar.gz \
   && mv nexus-3.28.0-01 nexus \
   && groupadd -g 1019 nexus \
   && useradd -r -u 1019 -g nexus -m nexus \
   && echo run_as_user=\"nexus\" > $NEXUS_HOME/nexus/bin/nexus.rc \
   && chown -R nexus:nexus $NEXUS_HOME/nexus \
   && chmod -R 755 $NEXUS_HOME/nexus \
   && chown -R nexus:nexus $NEXUS_HOME/sonatype-work \
   && chmod -R 755 $NEXUS_HOME/sonatype-work \
   && chmod +x /entrypoint.sh

#COPY conf/nexus.vmoptions $NEXUS_HOME/nexus/bin/nexus.vmoptions

USER nexus
VOLUME $NEXUS_HOME/sonatype-work
EXPOSE 8081
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/sonatype/nexus/bin/nexus"]