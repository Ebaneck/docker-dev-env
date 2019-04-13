#!/bin/bash
set -ex

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

IMAGE=registry.gitlab.com/ebaneck/docker-ci_storelift/dev-env
CONTAINER_NAME=cpp_python_storeliftdev

#project directory you will like to mount
DEMO_HOME=$SCRIPTDIR/dev-env-home

mkdir -p $DEMO_HOME

FONTCONF=.config/fontconfig/fonts.conf
if [ ! -e  $DEMO_HOME/$FONTCONF ] ; then
    mkdir -p `dirname $DEMO_HOME/$FONTCONF`
    cp $HOME/$FONTCONF $DEMO_HOME/$FONTCONF
fi

# Make xorg disable access control, i.e. let any x client connect to our

xhost +
docker run --rm --name $CONTAINER_NAME --privileged --net=host \
    -u `id -u`:`id -g` -e DISPLAY -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$DEMO_HOME:/home/$(id -un)" \
    $IMAGE
