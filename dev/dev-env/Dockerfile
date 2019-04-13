FROM registry.gitlab.com/ebaneck/docker-ci_storelift/build-env

#dev tools required for cpp applications
RUN apt-get update && apt-get install -y git qtcreator libxrender1 gdb fonts-ubuntu


#dev tools required for python dev
CMD ["/usr/bin/qtcreator"]