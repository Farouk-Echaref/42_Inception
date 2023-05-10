FROM debian:buster

WORKDIR /var/www

RUN apt-get update -y & apt install vsftpd -y

COPY ./tools/sftpScript.sh .

RUN chmod 777 ./sftpScript.sh

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 22

CMD ["./sftpScript.sh"]