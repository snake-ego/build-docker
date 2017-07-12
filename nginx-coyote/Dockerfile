FROM nginx:stable-alpine

COPY ./tools/coyote.bin /usr/local/bin/coyote
COPY ./tools/suexec.bin /usr/local/bin/suexec
COPY ./tools/request.sh /usr/local/bin/certificate 

RUN echo "\033[36m === Setup === \033[0m" \
    && set -x \
    && apk --update --no-cache add openssl ca-certificates\
    && chmod +x \
        /usr/local/bin/coyote \
        /usr/local/bin/suexec \
        /usr/local/bin/certificate \
    && adduser -HD -s /bin/false -G nginx -S coyote \
    && mkdir \
        /cert \
        /etc/nginx/partial.d \
        /etc/coyote \
        /var/cache/coyote/ \
    && echo "\033[36m === Coyote :: Account Key === \033[0m" \
    && openssl genrsa 4096 > /etc/coyote/account.key \
    && chown coyote /etc/coyote/account.key \
    && chmod 600 /etc/coyote/account.key

COPY ./files/nginx.challenges.conf /etc/nginx/partial.d/challenges.conf
COPY ./files/nginx.default.conf /etc/nginx/conf.d/default.conf

RUN echo "\033[36m === Nginx :: Challenges === \033[0m" \
    && set -x \
    && chown nginx:nginx /var/cache/coyote/ \
    && chmod 770 /var/cache/coyote/

VOLUME /cert

EXPOSE 443
