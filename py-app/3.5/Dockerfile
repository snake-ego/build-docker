FROM python:3.5-alpine

RUN  mkdir -p /app/{project,data}
WORKDIR /app/project

RUN apk add --update \
        build-base \
        git \
        mercurial \
        make \
    && pip install --upgrade pip \
    && rm /var/cache/apk/*

ENTRYPOINT ["/usr/bin/make"]