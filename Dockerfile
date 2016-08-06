FROM gliderlabs/alpine:3.4

MAINTAINER Rene Cunningham <rene@pitchfork.io>

ENV SSH_PUB_KEY=""

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk upgrade --update-cache --available

RUN apk add --update \
		openssh \
		nginx \
		supervisor

# Delete keys. They will be generated again by scythe_sshd
RUN rm -f /etc/ssh/ssh_host_*_key /etc/ssh/ssh_host_*_key.pub

COPY rootfs /

CMD ["/usr/bin/supervisord", "--nodaemon"]
