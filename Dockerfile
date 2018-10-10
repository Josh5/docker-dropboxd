FROM josh5/base-ubuntu:16.04
MAINTAINER Josh.5 "jsunnex@gmail.com"



### Install packages
RUN \
    echo "**** install dependencies ****" \
        && \
        apt-get update \
        && \
        apt-get install -y \
            python \
            wget \
            tar \
        && \
    echo "**** cleanup ****" \
        && \
        rm -rf /var/lib/apt/lists/*

### Set environment settings
ENV \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    HOME="/config"

ARG DOWNLOAD_URL=https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-58.4.92.tar.gz
### Fetch and install dropbox
RUN \
    echo "**** install dropbox package ****" \
        && \
        cd /tmp \
        && \
        wget --quiet -O /tmp/dropboxd.tar.gz "${DOWNLOAD_URL}" \
        && \
        tar -xf /tmp/dropboxd.tar.gz -C /opt \
        && \
        chmod -Rf a+w /opt/.dropbox-dist \
        && \
        mkdir -p /bin \
        && \
        wget --quiet -O /bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py" \
        && \
        chmod 755 /bin/dropbox.py \
        && \
    echo "**** set permissions ****" \
        && \
        chown -Rf docker:users /config \
        && \
    echo "**** cleanup ****" \
        && \
        rm -f /tmp/*

### Add local files
COPY root/ /

VOLUME \
    /config/ \
    /config/Dropbox
