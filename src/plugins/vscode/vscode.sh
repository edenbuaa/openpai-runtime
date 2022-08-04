#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

PAI_WORK_DIR=/usr/local/pai

echo "start vscode"

dpkg -i ${PAI_WORK_DIR}/plugins/vscode/code-server_4.5.1_amd64.deb

nohup code-server --host 0.0.0.0 --user-data-dir=/usr --port $SFE_WEB_VSCODE_PORT bash > /var/log/vscode.log 2>&1 &
