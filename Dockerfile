FROM ubuntu:latest
LABEL maintainer="Deepak Narayan <deepakknn@gmail.com>"

RUN apt-get update && \
    apt-get install -y sudo curl git-core gnupg linuxbrew-wrapper locales nodejs zsh wget nano nodejs npm fonts-powerline && \
    locale-gen en_US.UTF-8 && \
    adduser --quiet --disabled-password --shell /bin/zsh --home /home/developer --gecos "User" developer && \
    echo "developer:p@ssword1" | chpasswd &&  usermod -aG sudo developer

USER developer
ENV TERM xterm
CMD ["zsh"]
