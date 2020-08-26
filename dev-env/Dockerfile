# 基础镜像
FROM jiftle/lang-env:0.1
# FROM dev-env:0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# -------- 安装必要的软件工具 ----------
RUN apt update && apt install -y \
 tree


# ============== 变量定义==============
ARG INST_DIR="/instdir"

# ------------- 文件拷贝 -------------
COPY files ${INST_DIR}

# ---------- 基础环境变量 ----------
# RUN cat ${INST_DIR}/bash-env.rc >> /etc/bash.bashrc

# 处理配置文件
RUN cp -ar ${INST_DIR}/root/. /root/


# --------neovim 编辑器 ---------------
# RUN apt-get install -y software-properties-common \
#  && add-apt-repository ppa:neovim-ppa/stable \
#  && apt-get update \
#  && apt-get install -y neovim \
#  && apt-get install -y python-dev python-pip python3-dev python3-pip

# 清理临时文件
RUN rm -rf ${INST_DIR}

# --------- 创建用户
# RUN addgroup -g 1000 john && adduser -u 1000 -D -h /home/john -G john john
# USER john

# 设置工作目录
# WORKDIR /home/john
WORKDIR /root
