#!/bin/bash
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run  -it \
        --privileged=true \
        --volume=$XSOCK:$XSOCK:rw \
        --volume=$XAUTH:$XAUTH:rw \
        --volume="/dev/dri:/dev/dri:rw" \
        --env="XAUTHORITY=${XAUTH}" \
        --env="DISPLAY" \
        --ulimit core=9999999999999999\
        $* 
