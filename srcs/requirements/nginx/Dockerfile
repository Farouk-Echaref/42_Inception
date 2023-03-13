#Nginx Dockerfile

#rm -rf /var/lib/apt/lists/*: This command removes the package lists that 
#were downloaded during the update process to save disk space inside the container.

FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY ./tools/nginxScript.sh .

RUN chmod +x ./nginxScript.sh

COPY ./conf/default.conf /etc/nginx/conf.d

CMD ["./nginxScript.sh"]
