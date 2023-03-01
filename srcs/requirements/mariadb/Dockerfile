#MariaDB Dockerfile
#use a requirements.txt file in RUN

FROM alpine:3.15

RUN  apt-get update -y && apt-get install mariadb-server -y

EXPOSE 3306
        
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

CMD ["./tools/mariadbScript.sh"]
