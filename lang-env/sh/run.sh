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
# GitPath="${HOME}/wrk-git"
# GitPath="/work/git"
echo "------------- 运行[${DockerKey}:${DockerVer}]镜像的容器 ------------"

echo "  |--> 删除Docker实例，[${DockerName}] ..."
docker rm -f ${DockerKey}

echo "  |--> 开始启动Docker实例，[${DockerName}] ..."

# ----------- 运行容器 ------------
docker run -itd \
--name="${DockerKey}" \
-v ${HOME}/.ssh:/root/.ssh \
-h "${DockerKey}" \
--restart=always \
${DockerKey}:${DockerVer}

# docker run -itd \
# `# 注释请忽略，----------- 设置名称 -------------` \
# --name="devenv-vim" \
# `# 注释请忽略，----------- 工作目录映射 -------------` \
# -w /home/john `# 默认工作目录` \
# -v ${HOME}:/home/john `# 默认工作目录，映射` \
# -v ${GitPath}:/home/john/git `# git仓库目录` \
# `# 注释请忽略，----------- 用户密钥 -------------` \
# -v ${HOME}/.ssh:/root/.ssh `# .ssh密钥` \
# `# 注释请忽略，----------- 端口映射 -------------` \
# -p 8001:8001 `# 日志仓库，预览服务` \
# -p 8080:8080 `# web程序调试端口` \
# -p 8088:8088 `# web程序调试端口` \
# `# 注释请忽略，----------- 解决时区问题 -------------` \
# `# -e TZ="CST"` \
# -h "devenv-vim" `# 机器名` \
# --restart=always `# 自启动，容易导致挂载的分区，晚于docker` \
# `# 镜像名` \
# jiftle/devenv-vim:latest
echo "  |--> 启动Docker[${DockerName}]完毕. ^_^😁"

