#!/bin/bash
# -----------------------------------------------------------------
# FileName: run.sh
# Date: 2020-01-09
# Author: jiftle
# Description: 
# -----------------------------------------------------------------
set -e
# ------------ 引用脚本 --------------
cd ..
. ./conf.conf

# ------------ 业务脚本 --------------
# docker exec -it ${ContainerName} zsh

IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

echo "  |--> 当前主机IP: $IP"
xhost + $IP
docker exec -it -e DISPLAY=$IP:0 ${ContainerName} zsh
