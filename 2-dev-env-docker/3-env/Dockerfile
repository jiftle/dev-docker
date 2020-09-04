# 基础镜像
FROM jiftle/dev-env-tool:1.0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# ============== 变量定义==============
ARG INST_DIR="/instdir"
ARG USER="dev"
ARG HOME_DIR="/home/dev"

# --------------- 语言设置为中文
ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai

# ------------------- 账号 ---------------------
RUN \
echo "root:123456" | chpasswd \
&& \
groupadd $USER \
&& \
useradd -m -d $HOME_DIR -s /bin/bash -g $USER $USER \
&& \
echo "$USER:.ee" | chpasswd \
&& \
usermod -aG sudo $USER


# ------------ 处理时区问题 ----------------
RUN apt update

RUN apt update && export DEBIAN_FRONTEND=noninteractive \
&& apt install -y \
tzdata \
&& echo "Asia/Shanghai" > /etc/timezone \
&& dpkg-reconfigure -f noninteractive tzdata

# ---------- 环境变量处理 ----------
RUN \
echo 'export LC_ALL="zh_CN.UTF-8"' >> /etc/my.bashrc \
&& \
echo '' >> /etc/my.bashrc \
&& \
echo 'export TERM="xterm-256color"' >> /etc/my.bashrc \
&& \
echo '' >> /etc/my.bashrc


# ------------- 文件拷贝 -------------
COPY files ${INST_DIR}

# # ------------ ssh远程访问，启用vscode远程调试 ----------------
# # RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
# # && \
# # sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
# # && \
# # echo "export VISIBLE=now" >> /etc/profile
# 
# 
# ------------- vim配置 ---------------------
RUN \
cp -r ${INST_DIR}/conf/vim $HOME_DIR/.vim \
&& \
cp ${INST_DIR}/conf/vimrc $HOME_DIR/.vimrc \
&& \
chown -R $USER:$USER $HOME_DIR/.vim \
&& \
chown -R $USER:$USER $HOME_DIR/.vimrc

# --------------- zsh 终端美化 ------------------
RUN \
cp -r $INST_DIR/zsh/oh-my-zsh $HOME_DIR/.oh-my-zsh \
&& \
cp $INST_DIR/zsh/zshrc $HOME_DIR/.zshrc \
&& \
cp $INST_DIR/zsh/p10k.zsh $HOME_DIR/.p10k.zsh

# ----------- 清理临时文件 -----------
RUN rm -rf ${INST_DIR}

# ---------- apt 清理 --------------
RUN apt clean \
&& \
rm -rf /var/lib/apt/lists/*

# --------- 设置用户
USER dev

# 设置工作目录
WORKDIR /home/dev
