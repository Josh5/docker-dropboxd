FROM josh5/base-ubuntu:16.04
MAINTAINER Josh.5 "jsunnex@gmail.com"



### Install packages
RUN \
    echo "**** install dependencies ****" && \
        apt-get update \
        && \
        apt-get install -y \
            python \
            wget \
            tar \
        && \
    echo "**** install dropbox package ****" && \
        cd /tmp \
        && wget --quiet -O /tmp/dropboxd.tar.gz "https://www.dropbox.com/download/?plat=lnx.x86_64" \
        && tar -xf /tmp/dropboxd.tar.gz -C /opt \
        && chmod -Rf a+w /opt/.dropbox-dist \
        && mkdir -p /bin \
        && wget --quiet -O /bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py" \
        && chmod 755 /bin/dropbox.py \
        && \
    echo "**** cleanup ****" && \
        rm -f /tmp/* \
        && rm -rf /var/lib/apt/lists/*

### Add local files
COPY root/ /

### Set environment settings
ENV \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    HOME="/config"

VOLUME \
    /config/ \
    /config/Dropbox
