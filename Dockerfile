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
            libglib2.0-0 \
        && \
    echo "**** cleanup ****" \
        && \
        rm -rf /var/lib/apt/lists/*


### Set environment settings
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2


### Fetch and install dropbox
RUN \
    export DOWNLOAD_URL=https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-59.4.93.tar.gz \
    && \
    echo "**** install dropbox package ****" \
        && \
        cd /tmp \
        && \
        curl -SL "${DOWNLOAD_URL}" -o /tmp/dropboxd.tar.gz \
        && \
        tar -xf /tmp/dropboxd.tar.gz -C /opt \
        && \
        chmod -Rf a+w /opt/.dropbox-dist \
        && \
        mkdir -p /bin \
        && \
        curl -SL "http://www.dropbox.com/download?dl=packages/dropbox.py" -o /bin/dropbox.py \
        && \
        chmod 755 /bin/dropbox.py \
    && \
    echo "**** cleanup ****" \
        && \
        rm -f /tmp/*


### Add local files
COPY root/ /


VOLUME \
    /config/ \
    /config/Dropbox
