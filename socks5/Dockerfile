FROM alpine:edge

COPY ./docker-entrypoint.sh /

RUN set -x \
    && echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk add --update --no-cache dante-server \
    && chmod +x /docker-entrypoint.sh \
    && addgroup sock5 \
    && adduser -S sock5 sock5

COPY ./sockd.conf /etc/
    
EXPOSE 1080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD [ "sockd" ]