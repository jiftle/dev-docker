#!/bin/bash
# -----------------------------------------------------------------
# FileName: run.sh
# Date: 2020-01-09
# Author: jiftle
# Description: 
# -----------------------------------------------------------------
# set -e
# 引用脚本
cd ..
. ./conf.conf

# ------- 处理GUI显示的问题,原理:x11共享 -------
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

# --------------- 定义变量 ------------------
# GitPath="/usrlocal/git"
USER="dev"

echo "------------- 运行[${DockerKey}:${DockerVer}]镜像的容器 ------------"
echo "  |--> 当前主机IP: $IP"
# --------------- 定义变量 ------------------
GitPath="${HOME}/tg-git"
HostIp="$IP"

# echo "  |--> 删除Docker实例，[${DockerName}] ..."
# docker rm -f ${DockerKey}

# echo "---> 设置x11访问控制"
# xhost +

echo "  |--> 开始启动Docker实例，[${DockerName}] ..."

# ----------- 运行容器 ------------
docker run -itd \
--name="${ContainerName}" \
-h "${ContainerName}" \
`# 注释请忽略，----------- 工作目录映射 -------------` \
-v ${HOME}/.ssh:/home/$USER/.ssh `# .ssh密钥` \
-v ${HOME}/.gitconfig:/home/$USER/.gitconfig `# git配置文件` \
-v ${HOME}/.wakatime.cfg:/home/$USER/.wakatime.cfg `# wakatime编码时间统计` \
-v ${HOME}:/home/john `# 默认工作目录，映射` \
-v ${GitPath}:/home/john/git `# git仓库目录` \
`# 注释请忽略，----------- 端口映射 -------------` \
-p 58001:8001 `# 日志仓库，预览服务` \
-p 58080:8080 `# web程序调试端口` \
--restart=always \
--privileged \
`# -------------- GUI程序设置 ----------------` \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=${HostIp}:0 \
${DockerKey}:${DockerVer} \
/sbin/init

echo "  |--> 启动Docker[${DockerName}]完毕. ^_^😁"

