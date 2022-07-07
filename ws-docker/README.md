# Docker Install

## Remove existing
 yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

## Install docker now
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io

systemctl start docker

## Install Docker Compose

curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version


## File system management

# lsblk
The Present partition and filesystem mount point

# pvs
Print the current available Physical volume using “pvs“.

# pvcreate
Create the new Physical Volume using /dev/sdc1 partitioned disk.
pvcreate /dev/sdc1
# vgs
# lvs

lvreduce -L 100G /dev/centos/apps

lvreduce --resizefs -L 100G /dev/centos/apps


passfile-
bugzilla - abc@sd.com/admin@123
gitlab - techops/techops123
gitea - techops/admin@123
xwiki - techops/admin@123
Nexus - admin/admin@123