#!/bin/bash
#set -ex

IMAGE=registry.gitlab.com/ebaneck/docker-ci_storelift/dev-env
CONTAINER_NAME=storelift_dev

#project directory you will like to mount
DEMO_HOME=$HOME/dev-env-home

mkdir -p $DEMO_HOME


# Make xorg disable access control, i.e. let any x client connect to our

xhost +
docker run --rm --name $CONTAINER_NAME --privileged --net=host \
    -u `id -u`:`id -g` -e DISPLAY -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$DEMO_HOME:/home/$(id -un)" \
    $IMAGE
