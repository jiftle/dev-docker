#!/bin/bash
# -----------------------------------------------------------------
# FileName: run.sh
# Date: 2020-01-09
# Author: jiftle
# Description: 
# -----------------------------------------------------------------
# set -e
# 引用脚本
. ./conf.conf

# --------------- 定义变量 ------------------
echo "------------- 运行[${DockerKey}:${DockerVer}]镜像的容器 ------------"

echo "  |--> 删除Docker实例，[${DockerName}] ..."
docker rm -f ${DockerKey}

echo "  |--> 开始启动Docker实例，[${DockerName}] ..."

docker run -itd \
--name="${DockerKey}" \
-v ${HOME}/.ssh:/root/.ssh \
-v /Users/mac/docker-wrk/build-env/wsp:/wsp \
-h "${DockerKey}" \
${DockerKey}:${DockerVer}

echo "  |--> 启动Docker[${DockerName}]完毕. ^_^😁"

