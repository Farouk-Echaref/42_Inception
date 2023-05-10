#MariaDB Dockerfile

# FROM debian:bullseye

FROM debian:buster

apt update && apt install -y mariadb-server     

COPY ./tools/mariadbScript.sh .

RUN chmod 777 ./mariadbScript.sh

CMD ["./mariadbScript.sh"]
