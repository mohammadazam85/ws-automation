# Docker image for Nginx

## Build docker image
cd ../nginx-server/
docker build -t nginx-server:v1 .

## Docker image run

docker run -it -p 192.168.56.154:80:80 -p 192.168.56.154:443:443 -v /apps/nginx-html:/usr/share/nginx/html:ro -d nginx-server:v1

docker run -it -p 192.168.1.148:443:443 -v /apps/techopsdata/nginx-html:/usr/share/nginx/html:ro -d nginx-server:v1


https://gist.github.com/soheilhy/8b94347ff8336d971ad0


server {
    listen       80;
    ...
    location / {
        proxy_pass http://127.0.0.1:8080;
    }
    
    location /blog {
        proxy_pass http://127.0.0.1:8181;
    }

    location /mail {
        proxy_pass http://127.0.0.1:8282;
    }
    ...
}

## Create self signed certs
https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
