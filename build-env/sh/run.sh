#!/bin/bash
# -----------------------------------------------------------------
# FileName: run.sh
# Date: 2020-01-09
# Author: jiftle
# Description: 
# -----------------------------------------------------------------
set -e

cd ..
# 引用脚本
. ./conf.conf

# --------------- 定义变量 ------------------
WSP="$HOME/wsp/build-wsp"

# ----------------------------------------------------------------------
echo "------------- 运行[${DockerKey}:${DockerVer}]镜像的容器 ------------"

# echo "  |--> 删除Docker实例，[${DockerName}](${ContainerName}) ..."
# docker rm -f ${ContainerName}

echo "  |--> 开始启动Docker实例，[${DockerName}] ..."

docker run -itd \
--name="${ContainerName}" \
-v ${HOME}/.ssh:/root/.ssh \
-v ${WSP}:/wsp \
-h "${ContainerName}" \
${DockerKey}:${DockerVer}

echo "  |--> 启动Docker[${ContainerName}]完毕. ^_^😁"

