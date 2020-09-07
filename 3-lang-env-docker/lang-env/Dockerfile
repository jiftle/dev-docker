# 基础镜像
FROM jiftle/dev-env-env:1.0.2

# 维护者
MAINTAINER jiftle "lixugood@126.com"

USER root

# ============== 变量定义==============
ARG USER="dev"
ARG INST_DIR="/instdir"
ARG GOLANG_TAR="go1.14.8.linux-amd64.tar.gz"

# ------------------------- 安装软件 -------------
RUN apt update && apt install -y \
apt-utils \
tmux \
gitk \
meld

# ------------ 复制文件到 ----------------
COPY files ${INST_DIR}

# ----------- 发布版本信息 -------------
RUN cp $INST_DIR/docker-release /etc/

# ----------- go -----------------
RUN tar -C /usr/local -xf ${INST_DIR}/$GOLANG_TAR \
 && cat ${INST_DIR}/go-env.rc >> /etc/my.bashrc

# ---------- node ----------------
RUN tar -C /usr/local -xf ${INST_DIR}/node-v14.1.0-linux-x64.tar.xz \
 && mv /usr/local/node-v14.1.0-linux-x64 /usr/local/node \
 && cat ${INST_DIR}/node-env.rc >> /etc/my.bashrc

# --------- python 开发环境 --------------
RUN cp -r $INST_DIR/conf/pip /root/.pip \
&& \
cp -r $INST_DIR/conf/pip /home/$USER/.pip

# 安装jupyter notebook
RUN pip3 install jupyter && pip3 install  notebook

# ================= 运行脚本 ===============
RUN cp -r $INST_DIR/sh /home/$USER/ \
&& cd /home/$USER/sh .\
&& chmod +x *.sh

# ---------- 自定义脚本加入，系统环境变量----------
RUN echo ". /etc/my.bashrc" >> /etc/bash.bashrc

# ================ 修改权限，编译过程卡住 ===================
# RUN chown -R $USER:$USER /home/$USER/

## Emacs 配置
# ------------ 定义emacsclient的别名，Emacs后台服务模式启动，加快速度 -----------
RUN echo "alias em='emacs -nw'" >> /etc/my.bashrc
RUN echo "alias et='emacsclient -t'" >> /etc/my.bashrc

# *********************** 清理冗余文件**********************
RUN rm -rf ${INST_DIR} \
&& \
apt clean \
&& \
rm -rf /var/lib/apt/lists/* \
&& \
rm -rf /root/.cache/*


# --------- 设置用户
USER dev

# 设置工作目录
WORKDIR /home/dev

