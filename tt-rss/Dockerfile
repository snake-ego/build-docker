FROM php:fpm-alpine3.7

ENV TTRSS_VERSION=17.4

RUN set -x \
    && apk add --update --no-cache libwebp zlib libjpeg-turbo libpng-dev curl libpq \
    && apk add --update --no-cache --virtual .build-only \
    libwebp-dev zlib-dev libjpeg-turbo-dev libpng-dev curl-dev wget postgresql-dev\
    && docker-php-ext-install pdo json mbstring curl gd pdo_pgsql pgsql posix \ 
    && wget -O /tmp/ttrss.tar.gz "https://git.tt-rss.org/fox/tt-rss/archive/${TTRSS_VERSION}.tar.gz" \
    && tar -xzf /tmp/ttrss.tar.gz -C /tmp \
    && mv /tmp/tt-rss/* . \
    && apk del .build-only
