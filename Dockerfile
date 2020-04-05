FROM alpine:edge

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL \
    maintainer="jorge.barnaby@gmail.com" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="Nginx WebDav server" \
    org.label-schema.description="WebDav server based on Nginx and Alpine Linux" \
    org.label-schema.url="https://github.com/yorch" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/yorch/docker-nginx-webdav" \
    org.label-schema.vendor="Barnaby Tech" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

RUN apk add --no-cache \
    nginx \
    nginx-mod-http-dav-ext \
    apache2-utils

COPY docker/webdav.conf     /etc/nginx/conf.d/default.conf
COPY docker/entrypoint.sh   /entrypoint.sh

RUN chmod +x /entrypoint.sh \
    && mkdir /run/nginx

VOLUME /media

EXPOSE 80

CMD /entrypoint.sh && nginx -g "daemon off;"
