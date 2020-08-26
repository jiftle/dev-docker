# 基础镜像
FROM build-env:0.1

# 维护者
MAINTAINER jiftle "jiftle@163.com"

# ============== 变量定义==============
ARG INST_DIR="/instdir"

COPY files ${INST_DIR}

# ----------- go -----------------
RUN tar -C /usr/local -xf ${INST_DIR}/go1.15.linux-amd64.tar.gz \
 && cat ${INST_DIR}/go-env.rc > /etc/my.bashrc

# ---------- node ----------------
RUN tar -C /usr/local -xf ${INST_DIR}/node-v14.1.0-linux-x64.tar.xz \
 && mv /usr/local/node-v14.1.0-linux-x64 /usr/local/node \
 && cat ${INST_DIR}/node-env.rc >> /etc/my.bashrc

# ---------- 自定义脚本加入，系统环境变量----------
RUN echo ". /etc/my.bashrc" > /etc/bash.bashrc

# --------- 清理 -------------
RUN rm -rf ${INST_DIR}



