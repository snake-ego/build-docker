FROM python:3-alpine

RUN apk add --update \
        build-base \
    && pip install --upgrade pip \
    && pip install cython \
    && apk del \
        build-base \
    && rm /var/cache/apk/*