FROM debian:buster

RUN apt-get update -y & apt install vsftpd -y

COPY ./tools/ftpScript.sh /

CMD ["./ftpScript.sh"]