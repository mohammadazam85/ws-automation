FROM centos:7

RUN \
  yum -y install openssh-clients openssh-server && \
  yum -y clean all && \
  touch /run/utmp && \
  chmod u+s /usr/bin/ping && \
  echo "root:root" | chpasswd
RUN ssh-keygen -A \
    && exec /usr/sbin/sshd -D & 





EXTERNAL_URL="https://localhost" yum install -y gitlab-ee



CMD ["bash"]