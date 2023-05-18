#redis dockerfile

FROM debian:buster

RUN apt-get update 
RUN apt-get install redis-server -y 
RUN apt-get install php-redis -y

COPY ./shell/redisScript.sh .
COPY ./conf/redis.conf  /etc/redis/redis.conf

RUN chmod 777 redisScript.sh

RUN ./redisScript.sh

EXPOSE 6379

CMD [ "redis-server", "--protected-mode", "no"]
