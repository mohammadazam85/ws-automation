export GITLAB_HOME=/srv/gitlab

Local location	Container location	Usage
$GITLAB_HOME/data	/var/opt/gitlab	For storing application data
$GITLAB_HOME/logs	/var/log/gitlab	For storing logs
$GITLAB_HOME/config	/etc/gitlab	For storing the GitLab configuration files


web:
  image: 'gitlab/gitlab-ee:latest'
  restart: always
  hostname: 'gitlab.example.com'
  environment:
    GITLAB_OMNIBUS_CONFIG: |
      external_url 'http://gitlab.example.com:8929'
      gitlab_rails['gitlab_shell_ssh_port'] = 2224
  ports:
    - '8929:8929'
    - '2224:22'
  volumes:
    - '$GITLAB_HOME/config:/etc/gitlab'
    - '$GITLAB_HOME/logs:/var/log/gitlab'
    - '$GITLAB_HOME/data:/var/opt/gitlab'



export GITLAB_HOME=/apps/techopsdata/gitlab
docker run --detach \
  --hostname 127.0.0.1 \
  --publish 8443:443 --publish 8081:80 --publish 2221:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab:rw \
  --volume $GITLAB_HOME/logs:/var/log/gitlab:rw \
  --volume $GITLAB_HOME/data:/var/opt/gitlab:rw \
  gitlab/gitlab-ce:latest


 