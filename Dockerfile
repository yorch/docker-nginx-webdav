FROM alpine:edge
LABEL maintainer="jorge.barnaby@gmail.com"

RUN apk add --no-cache nginx apache2-utils

COPY docker/webdav.conf     /etc/nginx/conf.d/default.conf

COPY docker/entrypoint.sh   /entrypoint.sh

RUN chmod +x /entrypoint.sh

VOLUME /media

EXPOSE 80

CMD /entrypoint.sh && nginx -g "daemon off;"
