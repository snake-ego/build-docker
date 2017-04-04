FROM alpine:3.5

COPY ./tools/docker-entrypoint /entrypoint.sh
COPY ./tools/hugo.bin /usr/local/bin/hugo
COPY ./tools/suexec.bin /usr/local/bin/suexec

RUN set -x \
    && chmod +x \
        /entrypoint.sh \
        /usr/local/bin/hugo \
        /usr/local/bin/suexec \
    && mkdir \
        /app/ \
        /app/project \
        /app/build \

    && addgroup -S hugo \
    && adduser -S -h /app/project hugo hugo \
    && chown -R hugo:hugo /app/

WORKDIR "/app/project"

VOLUME ["/app/project", "/app/build"]
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve"]