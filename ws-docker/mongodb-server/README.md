## MongoDB Server Docker image

# Create docker image 

docker build  -t mongodb-server:v1 .

# Create docker volume 

docker volume create mongo-data

# Run docker container

mkdir -p /var/logs/mongodb 

docker run -it -p 127.0.0.1:27017:27017 -v mongo-data:/var/lib/mongo -v /var/logs/mongodb:/var/log/mongodb -d mongodb-server:v1

docker run -it -p 127.0.0.1:27017:27017 -v mongo-data:/var/lib/mongo -d mongodb-server:v1

mongo admin --eval "db.createUser({ user: 'techops', pwd: 'admin123', roles: [ { role: 'userAdminAnyDatabase', db: 'admin' }, 'readWriteAnyDatabase' ] });"

