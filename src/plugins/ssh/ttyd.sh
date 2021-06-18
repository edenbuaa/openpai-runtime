#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

PAI_WORK_DIR=/usr/local/pai

echo "start ttyd"

nohup ${PAI_WORK_DIR}/plugins/ssh/ttyd -t fontSize=16 bash > /var/log/ttyd.log 2>&1 &
