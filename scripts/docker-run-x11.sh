#!/bin/bash
source docker-pass-x.sh
docker run  -it \
        --privileged=true \
        --volume=$XSOCK:$XSOCK:rw \
        --volume=$XAUTHDIR:$XAUTHDIR:rw \
        --volume="/dev/dri:/dev/dri:rw" \
        --env="XAUTHORITY=${XAUTH}" \
        --env="DISPLAY" \
        --ulimit core=9999999999999999\
        $* 
