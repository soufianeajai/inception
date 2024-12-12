FROM alpine:3.19

RUN apk update && apk add --no-cache curl tar

RUN mkdir -p /var/lib/portainer

WORKDIR /usr/local/bin

RUN curl -L "https://github.com/portainer/portainer/releases/download/2.19.1/portainer-2.19.1-linux-amd64.tar.gz" | tar xvz

EXPOSE 7000

CMD ["/usr/local/bin/portainer/portainer"]
