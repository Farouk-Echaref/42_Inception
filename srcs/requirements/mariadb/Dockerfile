#Mariadb Dockerfile

FROM debian:buster

ARG DB_NAME \
    DB_USER \
    DB_ROOT_PASS \
    DB_USER_PASS \  
    DB_HOST

RUN apt-get update

RUN apt-get install mariadb-server -y

COPY ./conf/create_db.sh /tmp

RUN chmod 777 /tmp/create_db.sh

RUN /tmp/create_db.sh

EXPOSE 3306

CMD [ "mysqld" ]