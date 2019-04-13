# docker image with compiler, dependencies and all the other essentials needed to build our application
FROM ubuntu:18.04
MAINTAINER Claude Ebaneck
RUN apt-get update && apt-get install -y cmake g++ make qt5-default
CMD ["/bin/bash"]