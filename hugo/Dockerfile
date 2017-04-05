FROM alpine:3.5

COPY ./tools/node-v7.8.0.tar.xz /srv/node.tar.xz
COPY ./tools/docker-entrypoint /entrypoint.sh
COPY ./tools/hugo.bin /usr/local/bin/hugo
COPY ./tools/suexec.bin /usr/local/bin/suexec

RUN set -x \
    && echo "  == Prepare ==" \
    && mkdir \
        /app/ \
        /app/project \
        /app/build \
    && addgroup -S hugo \
    && adduser -S -h /app/project hugo hugo \
\
    && echo "  == Setup node.js ==" \
    && apk add --no-cache \
        libstdc++ \
    && apk add --no-cache --virtual .node-build-deps \
        binutils-gold \
        curl \
        g++ \
        gcc \
        libgcc \
        linux-headers \
        make \
        python \
    && cd /srv/ \
    && tar -xf "node.tar.xz" \
    && cd node* \
    && ./configure \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install \
    && cd - \
    && rm -rf /srv/* \
    && apk del .node-build-deps \
\
    && echo " == Install requred node modules ==" \
    && npm -g install yarn \
    && yarn global add bower gulp \
\
    && echo "  == Post Actions ==" \
    && set -x \
    && chmod +x \
        /entrypoint.sh \
        /usr/local/bin/hugo \
        /usr/local/bin/suexec \
    && chown -R hugo:hugo /app/ \


WORKDIR "/app/project"

VOLUME ["/app/project", "/app/build"]
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve"]
