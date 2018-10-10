# josh5/dropboxd

Environment for running dropbox headless


## Usage

```
PROJECT_NAME=dropboxd
CONFIG_DIR=/home/${USER}/appdata/dropboxd
DROPBOX_DIR=/home/${USER}/Dropbox
 
docker create --name=${PROJECT_NAME} \
    -e PGID=$(id -u) \
    -e PUID=$(id -u) \
    -v "${CONFIG_DIR}":"/config":rw \
    -v "${DROPBOX_DIR}":"/config/Dropbox":rw \
    --hostname=docker-$(hostname) \
    josh5/dropboxd
 
docker start ${PROJECT_NAME}
```

