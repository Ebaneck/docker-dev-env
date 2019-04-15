FROM registry.gitlab.com/ebaneck/docker-ci_storelift/build-env

#dev tools required for cpp applications
RUN apt-get update && apt-get install -y git vim sudo qtcreator build-essential cmake gdb libgl1-mesa-dev gcc g++ x11-apps libxrender1 gdb fonts-ubuntu

#creat new dev user
RUN useradd --create-home --shell /bin/bash developer
RUN echo 'developer:developer' | chpasswd
RUN usermod -aG sudo developer
RUN echo '%sudo     ALL=NOPASSWD: ALL' > /etc/sudoers.d/sudo-nopasswd
RUN chmod 0440 /etc/sudoers.d/sudo-nopasswd

USER developer
ENV HOME /home/developer
ENV LANG en-US

COPY local.conf /etc/fonts/local.conf
ENV DISPLAY :0
CMD ["/usr/bin/qtcreator"]