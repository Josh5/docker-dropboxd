
# josh5/dropboxd

Enviornment for running dropbox headless

### Builds "josh5/dropboxd"

```
docker build -t josh5/dropboxd .
```


## Usage

```
PROJECT_NAME=dropboxd
CONFIG_DIR=/home/${USER}/appdata/dropboxd
DROPBOX_DIR=/home/${USER}/Dropbox
 
docker create --name=${PROJECT_NAME} \
 -t -i \
-v "${CONFIG_DIR}":"/config":rw \
-v "${DROPBOX_DIR}":"/dropbox":rw \
josh5/dropboxd
 
docker start ${PROJECT_NAME}
```

