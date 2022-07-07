
Persistent Ulimit
/etc/security/limits.conf
nexus - nofile 65536

JVM Heap
-Xms4G
-Xmx4G
-XX:MaxDirectMemorySize=4014M

yum update -y
yum install java-1.8.0-openjdk.x86_64 -y

mkdir -p /apps/techops/sonatype
tar -zxf nexus-3.27.0-03-unix.tar.gz
mv nexus-3.27.0-03-unix nexus

  $ groupadd -g 1019 nexus
  $ useradd -r -u 1019 -g nexus -m nexus

 chown -R nexus:nexus /apps/techops/sonatype/nexus
 chown -R nexus:nexus /apps/techops/sonatype/sonatype-work

vi  /apps/techops/sonatype/nexus/bin/nexus.rc
Uncomment run_as_user parameter and set it as following.
run_as_user="nexus"

vi /apps/techops/sonatype/nexus/bin/nexus.vmoptions

-Xms2703m
-Xmx2703m
-XX:MaxDirectMemorySize=2703m
-XX:+UnlockDiagnosticVMOptions
-XX:+UnsyncloadClass
-XX:+LogVMOutput
-XX:LogFile=../sonatype-work/nexus3/log/jvm.log
-XX:-OmitStackTraceInFastThrow
-Djava.net.preferIPv4Stack=true
-Dkaraf.home=.
-Dkaraf.base=.
-Dkaraf.etc=etc/karaf
-Djava.util.logging.config.file=etc/karaf/java.util.logging.properties
-Dkaraf.data=/nexus/nexus-data
-Djava.io.tmpdir=../sonatype-work/nexus3/tmp
-Dkaraf.startLocalConsole=false

/apps/techops/sonatype/nexus/bin/nexus start
/apps/techops/sonatype/nexus/bin/nexus stop

Default username is admin

You can find the default admin password in /app/sonatype-work/nexus3/admin.password file.


docker run -it -p  192.168.1.148:8090:8081 -v /apps/techopsdata/nexus-data:/opt/sonatype/sonatype-work -d nexus-server:v1

docker run -it -p  192.168.56.154:8080:8081 -v /apps/nexus-data:/opt/sonatype/sonatype-work -d nexus-server:v1
