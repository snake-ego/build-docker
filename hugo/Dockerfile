FROM node:9-alpine

ARG hugo_version=0.37.1
ENV HUGO_VERSION=${hugo_version}

COPY ./tools/docker-entrypoint /entrypoint.sh
ADD http://af.it-test.pw/su-exec/alpine/suexec /usr/local/bin/
ADD https://github.com/gohugoio/hugo/releases/download/v0.37.1/hugo_${hugo_version}_Linux-64bit.tar.gz /usr/local/src/hugo.tar.gz

# == Prepare == 
RUN set -x \
    && mkdir \
        /app/ \
        /app/project \
        /app/build \
    && addgroup -S hugo \
    && adduser -S -h /app/project hugo hugo \
    && tar -xzf /usr/local/src/hugo.tar.gz -C /usr/local/bin/ hugo \
    && rm /usr/local/src/hugo.tar.gz

# == Install node modules ==
RUN set -x \
    && npm -g install yarn \
    && yarn global add bower gulp

# == Post Actions ==
RUN set -x \
    && chmod +x \
        /entrypoint.sh \
        /usr/local/bin/hugo \
        /usr/local/bin/suexec \
    && chown -R hugo:hugo /app/

WORKDIR "/app/project"

VOLUME ["/app/project", "/app/build"]
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve"]
