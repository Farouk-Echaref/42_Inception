FROM debian:buster

RUN apt update -y 

RUN apt install wget -y 

RUN apt install php php-mysql  -y

COPY ./tools/adminerScript.sh /

EXPOSE 1234

CMD ["./adminerScript.sh"]