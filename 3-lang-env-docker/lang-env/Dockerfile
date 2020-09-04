# 基础镜像
FROM jiftle/dev-env-env:1.0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

USER root

# ============== 变量定义==============
ARG INST_DIR="/instdir"
ARG GOLANG_TAR="go1.14.7.linux-amd64.tar.gz"

COPY files ${INST_DIR}

# ----------- go -----------------
RUN tar -C /usr/local -xf ${INST_DIR}/$GOLANG_TAR \
 && cat ${INST_DIR}/go-env.rc > /etc/my.bashrc

# ---------- node ----------------
RUN tar -C /usr/local -xf ${INST_DIR}/node-v14.1.0-linux-x64.tar.xz \
 && mv /usr/local/node-v14.1.0-linux-x64 /usr/local/node \
 && cat ${INST_DIR}/node-env.rc >> /etc/my.bashrc

# ---------- 自定义脚本加入，系统环境变量----------
RUN echo ". /etc/my.bashrc" >> /etc/bash.bashrc

# *********************** 清理冗余文件**********************
RUN rm -rf ${INST_DIR} \
&& \
apt clean \
&& \
rm -rf /var/lib/apt/lists/*


# --------- 设置用户
USER dev

# 设置工作目录
WORKDIR /home/dev

