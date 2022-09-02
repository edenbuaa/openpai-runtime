#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

PAI_WORK_DIR=/usr/local/pai

echo "start ttyd"
ttyPortName=SFE_WEB_TERMINAL_PORT_${FC_TASKROLE_NAME}_${FC_TASK_INDEX}
eval ttyPort=\${${ttyPortName}}
nohup ${PAI_WORK_DIR}/plugins/ssh/ttyd -t fontSize=16 -p $ttyPort bash > /var/log/ttyd.log 2>&1 &
