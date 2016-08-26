FROM gliderlabs/alpine:3.4

MAINTAINER Rene Cunningham <rene@compounddata.com>

ENV SSH_PUB_KEY=""

ENV VNC_PASSWD=""

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# apk
RUN apk upgrade --update-cache --available
RUN apk update

# supervisor
RUN apk add supervisor

# ssh
RUN apk add openssh

# nginx
RUN apk add nginx

# xvfb and vnc
RUN apk add xvfb x11vnc@testing ttf-dejavu

# xterm
RUN apk add xterm@testing

# Delete keys. They will be generated again by scythe_sshd
RUN rm -f /etc/ssh/ssh_host_*_key /etc/ssh/ssh_host_*_key.pub

COPY rootfs /

# prepare nginx 
RUN mkdir /run/nginx && rm -rf /var/www/localhost

# prepare sshd
RUN rm -f /etc/ssh/ssh_host_*_key /etc/ssh/ssh_host_*_key.pub

# set filesystem permissions
RUN chmod 0700 /root

CMD ["/usr/bin/supervisord", "--nodaemon"]
