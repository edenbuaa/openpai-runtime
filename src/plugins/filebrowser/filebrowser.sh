#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

PAI_WORK_DIR=/usr/local/pai

echo "start filebrowser"

tar -xzf ${PAI_WORK_DIR}/plugins/filebrowser/linux-amd64-filebrowser.tar.gz -C ${PAI_WORK_DIR}/plugins/filebrowser

rm -f ${PAI_WORK_DIR}/plugins/filebrowser/linux-amd64-filebrowser.tar.gz

${PAI_WORK_DIR}/plugins/filebrowser/filebrowser config init

${PAI_WORK_DIR}/plugins/filebrowser/filebrowser users add sfe sfe

${PAI_WORK_DIR}/plugins/filebrowser/filebrowser config set --auth.method=noauth --perm.download=false --locale=zh-cn

${PAI_WORK_DIR}/plugins/filebrowser/filebrowser users update sfe --perm.download=false --locale=zh-cn

nohup ${PAI_WORK_DIR}/plugins/filebrowser/filebrowser -p $SFE_WEB_FILEBROWSER_PORT -a 0.0.0.0 -d ${PAI_WORK_DIR}/plugins/filebrowser -r /mnt -b /filebrowser/svc-$FC_POD_NAME  &
