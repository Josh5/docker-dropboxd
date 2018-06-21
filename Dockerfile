FROM josh5/base-ubuntu16.04
MAINTAINER Josh.5 "jsunnex@gmail.com"



### Install packages
RUN \
    echo "**** install dependencies ****" && \
        apt-get update \
        && \
        apt-get install -y \
            openssh-server \
            python \
            wget \
            tar \
        && \
    echo "**** install dropbox package ****" && \
        cd /tmp \
        && wget --quiet -O /tmp/dropboxd.tar.gz "https://www.dropbox.com/download/?plat=lnx.x86_64" \
        && tar -xf /tmp/dropboxd.tar.gz -C /root \
        && mkdir -p /bin \
        && wget -O /bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py" \
        && chmod 755 /bin/dropbox.py \
        && rm /tmp/*

### Cleanup
RUN rm -rf /var/lib/apt/lists/*

### Add local files
COPY root/ /

VOLUME /config/