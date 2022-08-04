#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

PAI_WORK_DIR=/usr/local/pai

echo "start filebrowser"

tar -xzf ${PAI_WORK_DIR}/plugins/filebrowser/linux-amd64-filebrowser.tar.gz -C ${PAI_WORK_DIR}/plugins/filebrowser

rm -f ${PAI_WORK_DIR}/plugins/filebrowser/linux-amd64-filebrowser.tar.gz

${PAI_WORK_DIR}/plugins/filebrowser/filebrowser config init

${PAI_WORK_DIR}/plugins/filebrowser/filebrowser config set --auth.method=noauth

nohup ${PAI_WORK_DIR}/plugins/filebrowser/filebrowser -p $SFE_WEB_FILEBROWSER_PORT -a 0.0.0.0  -r /mnt  &
