#MariaDB Dockerfile

# FROM debian:bullseye

FROM debian:buster

RUN  apt-get update -y && apt-get install mariadb mariadb-client -y        

COPY ./tools/mariadbScript.sh .

RUN chmod 777 ./mariadbScript.sh

CMD ["./mariadbScript.sh"]
