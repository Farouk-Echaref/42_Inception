FROM debian:buster-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/portainer/portainer/releases/download/2.16.2/portainer-2.16.2-linux-amd64.tar.gz -O /tmp/portainer.tar.gz && \
    tar -xvf /tmp/portainer.tar.gz -C / && \
    rm /tmp/portainer.tar.gz && \
    chmod +x /portainer/portainer

ENTRYPOINT [ "/portainer/portainer" ]
