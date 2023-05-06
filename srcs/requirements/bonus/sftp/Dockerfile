FROM debian:buster

RUN apt-get update -y & apt install vsftpd -y

COPY ./tools/sftpScript.sh .

EXPOSE 21 22

CMD ["./sftpScript.sh"]