# 基础镜像
FROM jiftle/dev-env:0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# -------- 安装必要的软件工具 ----------

# ============== 变量定义==============
ARG INST_DIR="/instdir"

# ------------- 文件拷贝 -------------
COPY files ${INST_DIR}

# ---------- 基础环境变量 ----------
# RUN cat ${INST_DIR}/bash-env.rc >> /etc/bash.bashrc
RUN apt update && \
apt install -y \
libnss3 \
libxkbfile1 \
libsecret-1-0 \
libgtk-3-0 \
libxss1

# 处理配置文件
# RUN cp -ar ${INST_DIR}/root/. /root/

RUN dpkg -i ${INST_DIR}/code_1.48.2-1598353430_amd64.deb


# 清理临时文件
RUN rm -rf ${INST_DIR}

# --------- 创建用户
# RUN addgroup -g 1000 john && adduser -u 1000 -D -h /home/john -G john john
# USER john

# 设置工作目录
# WORKDIR /home/john
WORKDIR /root
