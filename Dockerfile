FROM ubuntu:18.04
LABEL maintainer="jorge.barnaby@gmail.com"

RUN apt-get update \
    && apt-get install -qqy --no-install-recommends \
    nginx \
    nginx-extras \
    apache2-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY docker/webdav.conf     /etc/nginx/conf.d/default.conf

COPY docker/entrypoint.sh   /

RUN chmod +x /entrypoint.sh \
    && rm /etc/nginx/sites-enabled/*

VOLUME /media

EXPOSE 80

CMD /entrypoint.sh && nginx -g "daemon off;"
