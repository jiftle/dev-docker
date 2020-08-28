# 基础镜像
FROM jiftle/dev-env-gui-base:0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# ============== 变量定义==============
ARG INST_DIR="/instdir"

# ------------- 文件拷贝 -------------
COPY files ${INST_DIR}

# ------------- 字体 ---------------------
RUN cd ${INST_DIR}/fonts && bash install.sh

# ------------- 安装vscode ---------------------
RUN dpkg -i ${INST_DIR}/app/code_1.48.2-1598353430_amd64.deb \
&& \
echo 'alias vscode="code --user-data-dir /root/.vscode"' >> /etc/my.bashrc \
&& \
echo '' >> /etc/my.bashrc


# ------------- 安装vim ---------------------
RUN cd ${INST_DIR}/app/vim && make install \
&& \
rm -rf /root/.vim \
&& \
cp -r ${INST_DIR}/conf/vim /root/ \
&& \
mv /root/vim /root/.vim


# ---------- 环境变量处理 ----------
RUN \
echo 'alias vi=vim' >> /etc/my.bashrc \
&& \
echo 'export LC_ALL="zh_CN.UTF-8"' >> /etc/my.bashrc \
&& \
echo '' >> /etc/my.bashrc \
&& \
echo 'export TERM="xterm-256color"' >> /etc/my.bashrc \
&& \
echo '' >> /etc/my.bashrc

# --------------- zsh 终端美化 ------------------
RUN apt update && \
apt install -y \
zsh

RUN \
cp -r $INST_DIR/zsh/oh-my-zsh /root/.oh-my-zsh \
&& \
cp $INST_DIR/zsh/zshrc /root/.zshrc \
&& \
cp $INST_DIR/zsh/p10k.zsh /root/.p10k.zsh


# *************************** 清理临时文件 **************************
RUN rm -rf ${INST_DIR}

# --------- 创建用户
# RUN addgroup -g 1000 john && adduser -u 1000 -D -h /home/john -G john john
# USER john

# 设置工作目录
# WORKDIR /home/john
WORKDIR /root
