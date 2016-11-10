FROM ubuntu:14.04.3

RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" > /etc/apt/sources.list.d/nginx-ppa.list \
    && echo "deb-src http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" >> /etc/apt/sources.list.d/nginx-ppa.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 3000

ADD nginx.conf /etc/nginx/nginx.conf
ADD index.html /srv/index.html

CMD  "/usr/sbin/nginx"
