#!/bin/sh

set -e
 
if [ "${1:0:1}" = '-' ]; then
    set -- sockd "$@"
fi

if [ ! -z "$SOCKS_USER" ] && [ ! -z "$SOCKS_PASSWORD" ]; then
    adduser -D $SOCKS_USER -s /sbin/nologin
    echo "${SOCKS_USER}:${SOCKS_PASSWORD}" | chpasswd
fi

exec "$@"
