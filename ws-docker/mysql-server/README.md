# MySQL Docker Image

## Build Docker Image
$ docker build -t mysql-base:v1.0.0 .

## Server prereqisite
1.  Create the user and group for mysql with id 27.

    $ groupadd -g 27 mysql
    $ useradd -r -u 27 -g mysql -s /bin/false mysql 

2. Create volume directory for persistant storage.
    $ mkdir -p /apps/techopsdata/bugzilla/mysql-data
    $ chown -R mysql:mysql /apps/techopsdata/bugzilla/mysql-data
## Run Docker container
$ docker run -it -p 192.168.1.148:3306:3306 -v /apps/techopsdata/bugzilla/mysql-data:/var/lib/mysql:rw -d   
-e MSQL_ROOT_PASSWORD=Admin@123  mysql-base:v1.0.0

## Allow firewall iptables
iptables -A INPUT -p tcp --dport 3306 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3306 -m conntrack --ctstate ESTABLISHED -j ACCEPT

