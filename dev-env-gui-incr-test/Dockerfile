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
ctags \
iputils-ping \
ack-grep \
iproute2 iproute2-doc \
openssh-server

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

# --------------- 按照ruby 和 colorls -------------
RUN \
apt install -y \
ruby-full \
&& \
gem install colorls

# ------------ ssh远程访问，启用vscode远程调试 ----------------
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
# && \
# sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
# && \
# echo "export VISIBLE=now" >> /etc/profile

# 清理临时文件
# RUN rm -rf ${INST_DIR}

# ---------- apt 清理 --------------
RUN apt clean \
&& \
rm -rf /var/lib/apt/lists/*

# --------- 创建用户
USER john

# 设置工作目录
WORKDIR /home/john
