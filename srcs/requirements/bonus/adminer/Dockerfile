FROM debian:buster

RUN apt-get update -y

RUN apt install wget -y && apt install php php-mysql  -y

COPY ./tools/adminerScript.sh /

CMD ["./adminerScript.sh"]