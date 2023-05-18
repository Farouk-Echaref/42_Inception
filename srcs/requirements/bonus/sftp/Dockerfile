FROM alpine:3.16

ARG FTP_USER \
    FTP_PASSWD

RUN apk update

RUN apk add vsftpd

COPY ./tools/sftpScript.sh .

RUN chmod 777 ./sftpScript.sh

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN sh sftpScript.sh

RUN service vsftpd start

EXPOSE 21 

ENTRYPOINT [ "usr/sbin/vsftpd" ]