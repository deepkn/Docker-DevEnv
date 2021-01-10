FROM ubuntu:latest
LABEL maintainer="Deepak Narayan <deepakknn@gmail.com>"

ARG tz="Asia/Kolkata"
ARG locale=en_US.UTF-8
ARG user=developer
ARG pass=p@ssword1

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y sudo curl git-core gnupg locales zsh wget nano vim fonts-powerline tzdata

# - Setup the user -------------------------------------------------------------
RUN useradd $user -m -s /bin/zsh --home /home/$user && \
    echo "$user:$pass" | chpasswd && usermod -aG sudo $user

# - Set the locale + timezone --------------------------------------------------
RUN echo $tz > /etc/timezone && \
    dpkg-reconfigure tzdata && \
    locale-gen $locale && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8


ENV LANG $locale
ENV LANGUAGE $locale
ENV LC_ALL $locale

USER $user
ENV TERM xterm
ENTRYPOINT ["zsh"]
