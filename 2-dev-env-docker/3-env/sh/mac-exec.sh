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


# ------- 处理GUI显示的问题,原理:x11共享 -------
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

echo "  |--> 当前主机IP: $IP"
xhost + $IP

# -------- 附加 -------
docker exec \
-it \
-w /home/john \
-u john \
-e DISPLAY=$IP:0 \
${ContainerName} \
zsh

# # -------- 附加 -------
# docker exec \
# -it \
# -w /home/john \
# -u john \
# -e DISPLAY=$IP:0 \
# ${ContainerName} \
# zsh
