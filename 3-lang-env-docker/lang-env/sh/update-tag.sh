#!/bin/bash
# -----------------------------------------------------------------
# FileName: run.sh
# Date: 2020-01-09
# Author: jiftle
# Description: 
# -----------------------------------------------------------------
set -e

cd ..
# ------------ 引用脚本 --------------
. ./conf.conf

echo "  |--> 修改tag镜像[${DockerKey}:${DockerVer}]开始..."
docker tag harbor40.newcapec.cn/p201/ide/dev-env:${DockerVer} ${DockerKey}:${DockerVer}

