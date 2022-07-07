## Docker Image Radis Server

# Build -
docker build -t redis-server:v1 .

# run redis server
docker volume create redis-data

docker run -d -p 127.0.0.1:6379:6379 -v /var/lib/docker/volumes/redis-data/:/data --name redis redis-server:v1 


Usage
Run redis-server
docker run -d --name redis -p 6379:6379 dockerfile/redis
Run redis-server with persistent data directory. (creates dump.rdb)
docker run -d -p 6379:6379 -v <data-dir>:/data --name redis dockerfile/redis
Run redis-server with persistent data directory and password.
docker run -d -p 6379:6379 -v <data-dir>:/data --name redis dockerfile/redis redis-server /etc/redis/redis.conf --requirepass <password>
Run 	
docker run -it --rm --link redis:redis redis-server:v1 bash -c 'redis-cli -h redis'


Slow Queries	slowlog get 25 Print top 25 slow queries
 	slowlog len
 	slowlog reset
Search / List All Keys	keys <pattern Use with care when on production!
 	keys myprefix*
 	keys *pattern*
 	keys *mysuffix
 	keys [a-c]* Use grep like expressions
Generic Key Handling	del <key> Delete key
 	dump <key> Serialize key
 	exists <key> Check for key
 	expire <key> <seconds> Set key TTL
Working with scalar types	get <key>
 	set <key> <value>
 	setnx <key> <value> Set key value only if key does not exist
 	Batch commands:
 	mget <key> <key> ...
 	mset <key> <value> <key> <value>
Working with counters	incr <key>
 	decr <key>
Redis Lists	lrange <key> <start> <stop> Accessing lists
 	lrange mylist 0 -1 Output all elements
 	lindex mylist 5 Get 5th element
 	llen mylist Get list length
 	 
 	lpush mylist "value" Push “value” to list
 	lpush mylist 5 Push number 5 to list
 	rpush mylist "value" Push “value” to beginning (unshift)
 	 
 	lpushx mylist 6 Only push if mylist exists
 	rpushx mylist 7
 	 
 	lpop mylist Remove+return value from list
 	rpop mylist Remove+return value from start (shift)
 	 
 	lrem mylist 1 "value" Remove ‘value’ count times
 	lset mylist 2 6 Set 3rd element to value 6
 	ltrim <key> <start> <stop>
Working with Redis Hashes	hexists myhash field1 Check if hash key exists
 	 
 	hget myhash field1 Get key value
 	hdel myhash field2 Delete key
 	hset myhash field1 "value" Set key with “value”
 	hsetnx myhash field1 "value"
 	 
 	hgetall myhash Get all hash content
 	hkeys myhash List all keys
 	hlen myhash List number of keys
 	 
 	Batch commands:
 	hmget <key> <key> ... Get multiple keys
 	hmset <key> <value> <key> <value> ... Set multiple keys
 	 
 	Counter commands
 	hincrby myhash field1 1
 	hincrby myhash field1 5
 	hincrby myhash field1 -1