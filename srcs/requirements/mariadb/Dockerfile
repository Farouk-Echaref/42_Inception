#MariaDB Dockerfile
#use a requirements.txt file in RUN

FROM debian:bullseye

RUN  apt-get update -y && apt-get install mariadb-server -y

EXPOSE 3306
        
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadbScript.sh .

RUN chmod +x ./mariadbScript.sh

CMD ["./mariadbScript.sh"]
