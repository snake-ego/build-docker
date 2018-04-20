#!/bin/sh

USER=coyote
CMD=/usr/local/bin/coyote
WORKDIR=/cert
KEY=/etc/coyote/account.key
TMP_DIR=/var/cache/coyote

cd $WORKDIR && suexec $USER $CMD -account-key $KEY -challenge-dir $TMP_DIR $@; cd -
killall -HUP nginx