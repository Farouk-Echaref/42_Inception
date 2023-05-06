FROM debian:buster

RUN apt-get update -y & apt install wget -y && apt install php php-mysql  -y

COPY ./tools/adminerScript.sh /

EXPOSE 1234

CMD ["./adminerScript.sh"]