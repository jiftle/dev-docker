# 基础镜像
FROM jiftle/dev-env-gui-base:0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# ============== 变量定义==============
ARG INST_DIR="/instdir"

# ------------- 文件拷贝 -------------
COPY files ${INST_DIR}

# ---------- 基础环境变量 ----------
# RUN cat ${INST_DIR}/bash-env.rc >> /etc/bash.bashrc

# ------------- 字体 ---------------------
RUN cd ${INST_DIR}/fonts && bash install.sh

# 处理配置文件
# RUN cp -ar ${INST_DIR}/root/. /root/

# ------------- 安装vscode ---------------------
RUN dpkg -i ${INST_DIR}/code_1.48.2-1598353430_amd64.deb \
&& \
echo 'alias vscode="code --user-data-dir /root/.vscode"' >> /etc/my.bashrc


# ------------- 安装vim ---------------------
RUN cd ${INST_DIR}/vim && make install \
&& \
rm -rf /root/.vim \
&& \
cp -r ${INST_DIR}/conf-dir/.vim /root/

# 清理临时文件
RUN rm -rf ${INST_DIR}

# --------------- 语言设置为中文
# ENV LANG C.UTF-8
# # 设置时区
# RUN echo 'Asia/Shanghai' >/etc/timezone


# --------- 创建用户
# RUN addgroup -g 1000 john && adduser -u 1000 -D -h /home/john -G john john
# USER john

# 设置工作目录
# WORKDIR /home/john
WORKDIR /root
