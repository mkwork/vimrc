#!/bin/bash
XSOCK=/tmp/.X11-unix
XAUTHDIR=/tmp/.docker.xauth.dir
XAUTH=${XAUTHDIR}/.docker.xauth
mkdir -p ${XAUTHDIR}
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
