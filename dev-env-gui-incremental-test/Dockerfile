# 基础镜像
FROM jiftle/dev-env-gui:0.2

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# ============== 变量定义==============
ARG INST_DIR="/instdir"

# ------------- 文件拷贝 -------------
# COPY files ${INST_DIR}

# ------------------- 安装软件 -----------------
RUN apt install -y \
sudo \
ctags

# ------------------- 账号 ---------------------
RUN \
echo "root:123456" | chpasswd \
&& \
groupadd john \
&& \
useradd -d /home/john -s /bin/bash -g john john \
&& \
echo "john:.ee" | chpasswd \
&& \
usermod -aG sudo john

# 清理临时文件
# RUN rm -rf ${INST_DIR}

# --------- 创建用户
# RUN addgroup -g 1000 john && adduser -u 1000 -D -h /home/john -G john john
USER john

# 设置工作目录
WORKDIR /home/john
