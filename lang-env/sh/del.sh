#!/bin/bash
# -----------------------------------------------------------------
# FileName: run.sh
# Date: 2020-01-09
# Author: jiftle
# Description: 
# -----------------------------------------------------------------
# ------------ 引用脚本 --------------
. ./conf.conf

# ------------------------------------
echo "  |--> 删除实例[${DockerKey}]"
docker rm -f ${DockerKey}

echo "  |--> 删除历史镜像[${DockerKey}:${DockerVer}]"
docker rmi -f ${DockerKey}:${DockerVer}
